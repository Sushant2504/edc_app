import 'package:edc_app/models/timeline_model.dart';
import 'package:edc_app/widgets/flutter_tinckercard_plus.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edc_app/screens/Vishwapreneur/intro_screen.dart';
import 'package:edc_app/screens/contact_us_screen.dart';
import 'package:edc_app/screens/newsletter_screen.dart';
import 'package:edc_app/utils/ui/app_theme.dart';
import 'package:edc_app/widgets/startup_card.dart';
import 'package:edc_app/models/startup_model.dart';
import 'package:edc_app/widgets/my_timeline_tile.dart';
import 'package:edc_app/widgets/year_card.dart';
import 'package:edc_app/widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeContentScreen(), // New widget to separate Home UI from Navigation handling
    VPScreen(),
    NewsletterScreen(),
    ContactUsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xFF3A2757),
        height: 70,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index: _currentIndex,
        items: [
          Icon(Icons.home, size: 40),
          Icon(Icons.event, size: 40),
          Icon(Icons.new_releases, size: 40),
          Icon(Icons.contact_emergency, size: 40),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class HomeContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/rocket-bg.png'),
    fit: BoxFit.cover,
    colorFilter: ColorFilter.mode(
      Colors.white.withOpacity(0.9), // Adjust opacity here (0.0 - 1.0)
      BlendMode.dstATop, // Ensures the overlay blends correctly
    ),
  ),
),
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('assets/images/rocket-bg.png'),
          //     fit: BoxFit.cover,
          //   ),
          // ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: Image.asset('assets/images/edc-logo.png'),
                ),
                SizedBox(height: 15),
                buildHeader("ENTREPRENEURSHIP DEVELOPMENT CELL, VIIT"),
                Divider(color: Colors.white, thickness: 1, indent: width * 0.1, endIndent: width * 0.1),
                SizedBox(height: 20),
                buildHeader("What makes us EDC?"),
                SizedBox(height: 20),
                buildInfoCard(
                  text:
                      "The Entrepreneurship Development Cell (EDC) empowers students by bridging academia with industry, fostering entrepreneurship and providing hands-on experience to convert ideas into successful ventures.",
                ),
                SizedBox(height: 20),
                buildHeader("OUR VISION"),
                SizedBox(height: 10),
                buildInfoCard(
                  text:
                      "The Entrepreneurship Development Cell fosters innovation and cultivates business skills among students, aiming to drive economic growth and contribute to societal progress.",
                ),
                SizedBox(height: 20),
                buildHeader("Latest Updates"),
                Divider(color: Colors.white, thickness: 1, indent: width * 0.1, endIndent: width * 0.1),
                buildHeader("Our Startups"),
                buildStartupCards(height, width),
                Divider(color: Colors.white, thickness: 1, indent: width * 0.1, endIndent: width * 0.1),
                buildHeader("TimeLine"),
                buildTimeline(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a simple styled header text
  Widget buildHeader(String text) {
    return Container(
      color: Colors.transparent,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds a reusable information card with background styling
  Widget buildInfoCard({required String text}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: Appthemes.ktextBackground,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.normal,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Builds a startup card slider (Tinder-style)
  Widget buildStartupCards(double height, double width) {
    return SizedBox(
      height: height * 0.55,
      child: TinderSwapCard(
        swipeUp: true,
        swipeDown: true,
        orientation: AmassOrientation.bottom,
        totalNum: startup.length,
        stackNum: 3,
        swipeEdge: 4.0,
        maxWidth: width * 0.97,
        maxHeight: height * 0.55,
        minWidth: width * 0.80,
        minHeight: height * 0.40,
        cardBuilder: (context, index) {
          return Card(
            child: StartupCard(startup[index]),
          );
        },
        cardController: CardController(),
        swipeCompleteCallback: (CardSwipeOrientation orientation, int index) {},
      ),
    );
  }

  /// Builds a dynamic timeline
  Widget buildTimeline() {
    return Column(
      children: List.generate(
        timelineData.length,
        (index) => MyTimelineTile(
          isFirst: index == 0,
          isLast: index == timelineData.length - 1,
          isPast: index < timelineData.length / 2,
          isicon: Icons.done,
          isstart: YearCard(year: timelineData[index].year),
          isend: EventCard(
            Title: timelineData[index].Title,
            Subtitle: timelineData[index].Subtitle,
          ),
        ),
      ),
    );
  }
}
