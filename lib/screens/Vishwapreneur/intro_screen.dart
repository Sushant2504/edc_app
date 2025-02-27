import 'package:edc_app/utils/constants/app_colors.dart';
import 'package:edc_app/utils/ui/app_theme.dart';
import 'package:edc_app/widgets/reusable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';

class VPScreen extends StatefulWidget {


  @override
  State<VPScreen> createState() => _VPScreenState();
}

class _VPScreenState extends State<VPScreen> with TickerProviderStateMixin {
  List<String> cardOneTitles = [
    "Motivation",
    "Guidance",
    "Networking",
    "Witness",
  ];

  List<String> cardOneSubtitles = [
    "Get inspired by the stories of successful entrepreneurs.",
    "Learn from the experiences of successful entrepreneurs.",
    "Get to know like-minded people.",
    "Startups that will go on to disrupt.",
  ];

  List<IconData> cardOneIcons = [
    FontAwesomeIcons.lightbulb,
    FontAwesomeIcons.book,
    FontAwesomeIcons.users,
    FontAwesomeIcons.rocket,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        //   colors: [
        //     kPrimaryColor,
        //     kSecondaryColor,
        //   ],
        // ),
        gradient: Appthemes.kGradient,
      ),
      child: Stack(children: [
        Positioned.fill(
          child: Image.asset(
            'assets/images/background.jpg', // Change this to your background image path
            fit: BoxFit.fill,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black
                .withOpacity(0.5), // Adjust opacity to make it darker
          ),
        ),
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 90,
              backgroundColor: Colors.transparent,
              child: Image.asset(
                "assets/images/vp_logo_new.png",
                height: 500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "ABOUT VISHWAPRENEUR",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BatmanForever',
                  color: AppColors.kYellow,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            //Animated Text
            const Text(
              "Vishwapreneur is a National Level Entrepreneurial Summit showcasing entrepreneurs, creators and innovative minds of our century who had the courage to think out of the box. Vishwapreneur is a platform for budding entrepreneurs to seek motivation & guidance through the experiences of successful business tycoons.",
              style: TextStyle(
                // color: Color.fromARGB(255, 194, 193, 193),
                color: Color.fromARGB(255, 219, 219, 219),
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildHeader("WHY VISHWAPRENEUR", color: AppColors.kYellow),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CardOne(
                  title: cardOneTitles[0],
                  subtitle: cardOneSubtitles[0],
                  icon: cardOneIcons[0],
                ),
                CardOne(
                  title: cardOneTitles[1],
                  subtitle: cardOneSubtitles[1],
                  icon: cardOneIcons[1],
                ),
              ],
            ),

            Row(
              children: [
                CardOne(
                  title: cardOneTitles[2],
                  subtitle: cardOneSubtitles[2],
                  icon: cardOneIcons[2],
                ),
                CardOne(
                  title: cardOneTitles[3],
                  subtitle: cardOneSubtitles[3],
                  icon: cardOneIcons[3],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            buildHeader("OUR VISION", color: AppColors.kYellow),
            const SizedBox(
              height: 20,
            ),
            //Animated Text
            const Text(
              "The motto of Vishwapreneur is to bring in young entrepreneurs students creators vcs and  booming startups which will be the facets of future India together.",
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            buildHeader("OUR MISSION", color: AppColors.kYellow),
            const SizedBox(
              height: 20,
            ),
            //Animated Text
            const Text(
              "The promotion of entrepreneurship is Vishwapreneur's main goal. Entrepreneurs are creative thinkers that spot and seize new business possibilities, launching new businesses and industries that propel economic expansion. We can enable people to follow their passions and make their ideas a reality by promoting and fostering entrepreneurship. This may result in the production of new products and services, new markets being opened, and new technological advancements, all of which may benefit society as a whole.It is essential for promoting a culture of innovation and creativity as well as for the continuous expansion and prosperity of our economy. We can contribute to the development of a more vibrant and dynamic business climate that is better prepared to face the challenges of the future by offering resources and support to prospective entrepreneurs.",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),


            // team of the VP
            // const SizedBox(
            //   height: 20,
            // ),
            // buildHeader("OUR TEAM"),
            // const SizedBox(
            //   height: 20,
            // ),
            // Wrap(
            //   children: [
            //     //People Cards
            //     buildPeopleCard(),
            //     buildPeopleCard(),
            //     buildPeopleCard(),
            //     buildPeopleCard(),
            //   ],
            // ),
            const SizedBox(
              height: 20,
            ),
            //Contact Us
            Center(
              child: Text(
                'CONTACT US',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'BatmanForever',
                  color: AppColors.kYellow,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'Vishwapreneur',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // fontFamily: 'BatmanForever',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: Text(
                'EDC HQ, VIIT Campus, Kondhwa, Pune-48',
                style: TextStyle(
                  fontSize: 15,
                  // fontFamily: 'BatmanForever',
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            

            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.kYellow,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    launchUrlString(
                      'https://vishwapreneur.in',
                      mode: LaunchMode.inAppBrowserView,
                    );
                  },
                  child: const Text("Our Website"),
                ),
              ],
            ),
            // Center(
            //   child: GestureDetector(
            //     onTap: () {
            //       launchUrlString('https://vishwapreneur.in');
            //     },
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         const Text(
            //           'Website: ',
            //           style: TextStyle(
            //             fontSize: 15,
            //             // fontFamily: 'BatmanForever',
            //           ),
            //         ),
            //         const Text(
            //           'www.vishwapreneur.in',
            //           style: TextStyle(
            //             fontSize: 15,
            //             // fontFamily: 'BatmanForever',
            //             decoration: TextDecoration.underline,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),

            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: AppColors.kYellow,
              ),
              title: Text(
                "Queries",
                style: TextStyle(color: AppColors.kYellow),
              ),
              subtitle: GestureDetector(
                onTap: () {
                  //Launch email client
                  launchUrlString("mailto:contact@vishwapreneur.in");
                },
                child: const Text(
                  "contact@vishwapreneur.in",
                  //underline text
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.dollarSign,
                color: AppColors.kYellow,
              ),
              title: Text(
                "Sponsorship Opportunities",
                style: TextStyle(color: AppColors.kYellow),
              ),
              subtitle: GestureDetector(
                onTap: () {
                  //Launch email client
                  launchUrlString("mailto:edcflm.sponsorship@gmail.com");
                },
                child: const Text(
                  "edcflm.sponsorship@gmail.com",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.handshake,
                color: AppColors.kYellow,
              ),
              title: Text(
                "Collaboration Opportunities",
                style: TextStyle(color: AppColors.kYellow),
              ),
              subtitle: GestureDetector(
                onTap: () {
                  //Launch email client
                  launchUrlString("mailto:pr@vishwapreneur.in");
                },
                child: const Text(
                  "pr@vishwapreneur.in",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.microphone,
                color: AppColors.kYellow,
              ),
              title: Text(
                "Speaking Opportunities",
                style: TextStyle(
                  color: AppColors.kYellow,
                ),
              ),
              subtitle: GestureDetector(
                onTap: () {
                  //Launch email client
                  launchUrlString("mailto:curation@vishwapreneur.in");
                },
                child: const Text(
                  "curation@vishwapreneur.in",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                FontAwesomeIcons.phone,
                color: AppColors.kYellow,
              ),
              title: Text(
                "Call Us",
                style: TextStyle(
                  color: AppColors.kYellow,
                ),
              ),
              subtitle: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      launchUrlString('tel:7900021805');
                    },
                    child: const Text(
                      '7900021805,',
                      style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,

                        // fontWeight: FontWeight.bold,
                        // fontFamily: 'BatmanForever',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      launchUrlString('tel:7028800769');
                    },
                    child: const Text(
                      '7028800769',
                      style: TextStyle(
                        fontSize: 15,
                        decoration: TextDecoration.underline,

                        // fontWeight: FontWeight.bold,
                        // fontFamily: 'BatmanForever',
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ]),
    );
  }

  Widget buildPeopleCard() {
    return Card(
      //Acrylic Effect
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: Colors.white.withOpacity(0.05),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 150,
        height: 200,
        alignment: Alignment.center,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1606002830191-c1b4f20e6cda?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=465&q=80'),
            ),
            Text(
              'Richard Branson',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'CEO of Virgin Group',
              maxLines: 3,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  const CardOne({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  final IconData icon;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: Colors.white.withOpacity(0.05),
        elevation: 10,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
                color: AppColors.kYellow,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}