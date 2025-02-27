import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:edc_app/widgets/animated_card.dart';
import 'package:edc_app/widgets/feedback_form.dart';

class ContactUsScreen extends StatefulWidget {
  @override
  _ContactUsScreenState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  bool _showForm = false;

  // Method to toggle the visibility of the form
  void _toggleForm() {
    setState(() {
      _showForm = !_showForm;
    });
  }

  // Method to close the form when tapping the backdrop
  void _closeForm() {
    setState(() {
      _showForm = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust button size based on screen width
    double buttonWidth = screenWidth * 0.6; // 60% of screen width
    double buttonHeight = 50.0; // Fixed button height

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AnimatedCard(),
                  SizedBox(height: screenHeight * 0.05), // Adjusted spacing based on screen height
                  ElevatedButton(
                    onPressed: _toggleForm,
                    child: Text("Feedback"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      minimumSize: Size(buttonWidth, buttonHeight), // Adjusted size
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_showForm)
            GestureDetector(
              onTap: _closeForm, // Close the form if tapping outside
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AnimatedOpacity(
                  opacity: _showForm ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 1),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {}, // Prevent taps inside the form from closing it
                      child: FeedbackForm(
                        onBackPressed: _closeForm, // Close the form when back button is clicked
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
