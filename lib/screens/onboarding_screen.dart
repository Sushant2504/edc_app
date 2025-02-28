import 'package:edc_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/onboardingpage.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  final List<OnboardingPage> _onboardingPages = [
    OnboardingPage(
      title: 'Turn Your Ideas into Reality!',
      description:
          "Join your college’s EDC community and kickstart your entrepreneurial journey. Get access to resources, events, and mentorship to bring your ideas to life.",
      svg: 'assets/images/onboard2.svg', // Use SVG instead of image
    ),
    OnboardingPage(
      title: 'Learn from Experts & Grow Your Skills',
      description:
          'Attend workshops, masterclasses, and hands-on training sessions by successful entrepreneurs and industry leaders to enhance your startup knowledge',
      svg: 'assets/images/onboard3.svg', // Use SVG instead of image
    ),
    OnboardingPage(
      title: 'Build, Network & Succeed',
      description:
          'Find like-minded students, collaborate on startup ideas, pitch to investors, and showcase your innovation at EDC-organized events and competitions',
      svg: 'assets/images/onboard1.svg', // Use SVG instead of image
    ),
  ];

  void _nextPage() {
    if (_currentPage < _onboardingPages.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _onboardingPages.length,
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    onboardingPage: _onboardingPages[index],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Skip button
                TextButton(
                  onPressed: () {
                    _pageController.jumpToPage(_onboardingPages.length - 1);
                  },
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Center(
                          child: Text('Skip',
                              style: TextStyle(color: Colors.grey)))),
                ),
                // Page indicator
                Row(
                  children: List.generate(
                    _onboardingPages.length,
                    (index) => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentPage == index ? Colors.blue : Colors.grey,
                      ),
                    ),
                  ),
                ),
                // Next or Get Started button

                _currentPage == _onboardingPages.length - 1
                    ? InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _nextPage();
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: CircleAvatar(
                            radius: 30,
                            child: Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}


// Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => HomeScreen()),
// );
