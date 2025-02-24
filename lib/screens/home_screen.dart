import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edc_app/models/startup_model.dart';
import 'package:edc_app/screens/Vishwapreneur/intro_screen.dart';
import 'package:edc_app/screens/contact_us_screen.dart';
import 'package:edc_app/screens/newsletter_screen.dart';
import 'package:edc_app/widgets/article_screen.dart';
import 'package:edc_app/utils/ui/app_theme.dart';
import 'package:edc_app/widgets/event_card.dart';
import 'package:edc_app/widgets/my_timeline_tile.dart';
import 'package:edc_app/widgets/reusable.dart';
import 'package:edc_app/widgets/startup_card.dart';
import 'package:edc_app/widgets/year_card.dart';
import 'package:flutter/material.dart';
import 'package:edc_app/widgets/flutter_tinckercard_plus.dart';
import '../models/timeline_model.dart';

// currentIndex for the startup cards.....
int currentIndex = 0;

// list of the years for the timeline  purpose
final List<String> years = [
  "2008",
  "2012",
  "2013",
  "2014",
  "2015",
  "2016",
  "2017",
  "2018",
  "2019",
  "2020",
  "2021",
  "2022",
  "2023"
];


// bottom navbar items .....

final items = <Widget>[
    Icon(Icons.home, size: 40),
    Icon(Icons.event, size: 40),
    Icon(Icons.new_releases, size: 40,),
    Icon(Icons.contact_emergency, size: 40,), 
];


final screens = [
   HomeScreen(),
   VPScreen(),
   NewsletterScreen(),
   ContactUsScreen(),
];


var currentSelectedIndex = 0;

// homescren of the edc application
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CardController controller;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Color.fromARGB(255, 79, 29, 171)),
        ),
        child: CurvedNavigationBar(
           backgroundColor: Colors.blue,
           height: 70,
          
           animationCurve: Curves.easeInOut,
           animationDuration: Duration(milliseconds: 300),
           index: index,
           items: items,
           onTap: (index) => setState(() => this.index = index),
        ),
      ),
      
      body: Stack(
        children: [
          Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/rocket-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/edc-logo.png'),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  buildHeader(
                    "ENTREPRENEURSHIP DEVELOPMENT CELL, VIIT",
                  ),
                  Container(
                    width: width * 0.9,
                    child: const Divider(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  buildHeader("WHAT MAKES US EDC"),
                  const SizedBox(height: 20),
                  Container(
                    height: height * 0.2,
                    width: width * 0.95,
                    decoration: Appthemes.ktextBackground,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "The Entrepreneurship Development Cell (EDC) empowers students by bridging academia with industry, fostering entrepreneurship and providing hands-on experience to convert ideas into successful ventures.",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: width * 0.9,
                    child: const Divider(color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  buildHeader("OUR VISION"),
                  const SizedBox(height: 10),
                  Container(
                    height: height * 0.17,
                    width: width * 0.95,
                    decoration: Appthemes.ktextBackground,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: const Text(
                        """The Entrepreneurship Development Cell fosters innovation and cultivates business skills among students, aiming to drive economic growth and contribute to societal progress.""",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.normal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: width * 0.9,
                    child: const Divider(color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  buildHeader("Latest Updates"),
                  const SizedBox(height: 10),
                  Container(
                    width: width * 0.9,
                    child: const Divider(color: Colors.white),
                  ),
                  buildHeader("Our Startups"),
                  Center(
                    child: SizedBox(
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
                          final cardIndex =
                              (currentIndex + index) % startup.length;
                          return Card(
                            child: StartupCard(startup[cardIndex]),
                          );
                        },
                        cardController: controller = CardController(),
                        swipeUpdateCallback:
                            (DragUpdateDetails details, Alignment align) {
                          /// Get swiping card's alignment
                          if (align.x < 0) {
                            //Card is LEFT swiping
                            print("right swipe");
                          } else if (align.x > 0) {
                            //Card is RIGHT swiping
                            print("left swipe");
                          }
                        },
                        swipeCompleteCallback:
                            (CardSwipeOrientation orientation, int index) {
                          // Update the current index when a card is swiped
                          setState(() {
                            currentIndex = (currentIndex + 1) %
                                startup
                                    .length; // Loop back to 0 after the last card
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: width * 0.9,
                    child: const Divider(color: Colors.white),
                  ),
                  buildHeader("TimeLine"),
                 
                     Column(
                          children: [
                            //start timeline..
                            MyTimelineTile(
                              isFirst: true,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: false,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: false,
                              isPast: true,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                     
                            //middle timeline...
                            MyTimelineTile(
                              isFirst: false,
                              isLast: true,
                              isPast: true,
                              isicon: Icons.done,
                              isstart: YearCard(year: timelineData[0].year),
                              isend: EventCard(Title: timelineData[0].Title, Subtitle: timelineData[0].Subtitle),
                            ),
                          ],
                        ),

                        SizedBox(width: 15),
                   ],
                 ),
                  
              
              ),
            ),
          
        ],
      ),
    );
  }
}
