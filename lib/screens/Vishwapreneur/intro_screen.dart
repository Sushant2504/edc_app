import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class VPScreen extends StatefulWidget {
  @override
  _VPScreenState createState() => _VPScreenState();
}

class _VPScreenState extends State<VPScreen> {
  //  Nested List of Image Paths for each Carousel
  final List<List<String>> carousels = [
    List.generate(4, (index) => 'assets/images/vp$index.jpg'),
    List.generate(3, (index) => 'assets/images/vp${index + 4}.jpg'),
    List.generate(5, (index) => 'assets/images/vp${index + 7}.jpg'),
  ];

  //  Current indexes for each carousel (State Management)
  final List<int> currentIndexes = List.filled(3, 0); // Initial index for each carousel

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Vishwapreneur",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            letterSpacing: 1.5,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black, // Background color for smooth UI
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          itemCount: carousels.length, // Number of carousels
          itemBuilder: (context, carouselIndex) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.black, // Dark theme for contrast
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: Offset(3, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                   _buildCarousel(carouselIndex),
                  SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Carousel Widget (Uses Indexed Data)
  Widget _buildCarousel(int carouselIndex) {
    bool reverseScroll = carouselIndex % 2 == 1; // Alternate scroll direction
    Curve scrollCurve = carouselIndex == 2 ? Curves.easeInBack : Curves.easeInOut; // Different effect for last carousel

    return CarouselSlider(
      options: CarouselOptions(
        height: 200,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayCurve: scrollCurve,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        scrollDirection: Axis.horizontal,
        reverse: reverseScroll,
        onPageChanged: (index, reason) {
          setState(() {
            currentIndexes[carouselIndex] = index; // Update index for this carousel
          });
        },
      ),
      items: carousels[carouselIndex].map((imagePath) {
        return _buildCarouselItem(imagePath);
      }).toList(),
    );
  }

  // 🖼️ Styled Image Cards
  Widget _buildCarouselItem(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(3, 5),
            ),
          ],
        ),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }

  // 🔵 Page Indicator Dots (Each Carousel Has Its Own Indicator)
  Widget _buildIndicator(int carouselIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(carousels[carouselIndex].length, (dotIndex) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 4),
          width: currentIndexes[carouselIndex] == dotIndex ? 12 : 8,
          height: currentIndexes[carouselIndex] == dotIndex ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndexes[carouselIndex] == dotIndex ? Colors.blueAccent : Colors.white.withOpacity(0.5),
          ),
        );
      }),
    );
  }
}
