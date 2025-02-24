import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedCard extends StatefulWidget {
  @override
  _AnimatedCardState createState() => _AnimatedCardState();
}

class _AnimatedCardState extends State<AnimatedCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat(); // Repeat animation indefinitely
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.15),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Rotating Waves in the Background with continuous loop
              Positioned.fill(
                child: Stack(
                  children: [
                    // Adjust wave size and duration for seamless continuous animation
                    AnimatedWave(controller: _controller, duration: 6, size: screenWidth * 1.5),
                    AnimatedWave(controller: _controller, duration: 8, size: screenWidth * 1.4),
                    AnimatedWave(controller: _controller, duration: 10, size: screenWidth * 1.3),
                  ],
                ),
              ),
              // Static Card Content - Positioned above the waves
              Container(
                width: screenWidth * 0.9, // Adjust width based on screen size
                height: screenHeight * 0.7, // Adjust height based on screen size
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFAF40FF),
                      Color(0xFF5B42F3),
                      Color(0xFF00DDEB)
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "Contact Us",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06, // Adjust font size based on screen size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      buildContactItem(Icons.phone, "Phone", ["+91-7900021805", "+91-8668351747"]),
                      buildContactItem(Icons.email, "For Sponsors & Partners", ["edcflm.sponsorship@gmail.com"]),
                      buildContactItem(Icons.email, "For Industry Collaborations", ["edc@viit.ac.in"]),
                      buildContactItem(Icons.location_on, "Address", [
                        "S.No.3 & 4, Entrepreneurship\nDevelopment Cell, VIIT,",
                        "Kondhwa BK., Pune, Maharashtra\n411048"
                      ]),
                      buildContactItem(Icons.web, "Website", ["https://edcviit.com"]),
                      SizedBox(height: screenHeight * 0.02),
                      Center(
                        child: Text(
                          "Follow us on:",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04, // Adjust font size based on screen size
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          buildSocialIcon(Icons.facebook),
                          SizedBox(width: screenWidth * 0.02),
                          buildSocialIcon(Icons.photo_camera), // Instagram icon
                          SizedBox(width: screenWidth * 0.02),
                          buildSocialIcon(Icons.business), // LinkedIn icon
                          SizedBox(width: screenWidth * 0.02),
                          buildSocialIcon(Icons.alternate_email), // Twitter icon
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContactItem(IconData icon, String title, List<String> content) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.white, size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                ...content.map(
                  (text) => Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSocialIcon(IconData icon) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 16,
      child: Icon(icon, color: Color(0xFF5B42F3), size: 16),
    );
  }
}

class AnimatedWave extends StatelessWidget {
  final AnimationController controller;
  final int duration;
  final double size;

  AnimatedWave({
    required this.controller,
    required this.duration,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (_, __) {
        return Transform.rotate(
          angle: controller.value * 2 * pi / duration,
          child: Center(
            child: Container(
              width: size,
              height: size * 1.3, // Make it a rectangle
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFAF40FF).withOpacity(0.5),
                    Color(0xFF5B42F3).withOpacity(0.5),
                    Color(0xFF00DDEB).withOpacity(0.5)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(40), // Rounded corners
              ),
            ),
          ),
        );
      },
    );
  }
}
