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
      backgroundColor: Color.fromARGB(255, 45, 1, 63),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                AnimatedCard(),
                SizedBox(height: screenHeight * 0.05), // Adjusted spacing based on screen height
                ElevatedButton(
                  onPressed: _toggleForm,
                  child: Text("Feedback"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFF5900),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    minimumSize: Size(buttonWidth, buttonHeight), // Adjusted size
                  ),
                ),
              ],
            ),
          ),
          if (_showForm)
            GestureDetector(
              onTap: _closeForm, // Close the form if tapping outside
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AnimatedOpacity(
                  opacity: _showForm ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 300),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                          
                      }, // Prevent taps inside the form from closing it
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