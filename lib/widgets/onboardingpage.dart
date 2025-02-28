import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Import flutter_svg

class OnboardingPage {
  final String title;
  final String description;
  final String svg; // Use SVG instead of image

  OnboardingPage({
    required this.title,
    required this.description,
    required this.svg,
  });
}

class OnboardingPageWidget extends StatelessWidget {
  final OnboardingPage onboardingPage;

  const OnboardingPageWidget({super.key, required this.onboardingPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SVG with gradient overlay
        Container(
          height:
              MediaQuery.of(context).size.height * 0.5, // Half screen height
          decoration: BoxDecoration(
            color: Colors.white, // Background color for SVG
          ),
          child: Stack(
            children: [
              // SVG
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: SvgPicture.asset(
                    onboardingPage.svg, // this is for the svg purpose importing from t he svg package of flutter ...... 
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
              // Gradient overlay at the bottom
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.white.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Text content
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                onboardingPage.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                onboardingPage.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
