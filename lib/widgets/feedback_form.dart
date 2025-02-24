import 'package:flutter/material.dart';

class FeedbackForm extends StatelessWidget {
  final VoidCallback onBackPressed;

  FeedbackForm({required this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    // Get screen size using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Adjust form size based on screen width and height
    double formWidth = screenWidth * 0.85; // 85% of screen width
    double formHeight = screenHeight * 0.55; // 55% of screen height

    return Center(
      child: Container(
        width: formWidth,
        height: formHeight,
        padding: EdgeInsets.all(screenWidth * 0.05), // Adjust padding based on screen width
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E3C72), Color(0xFF2A5298)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(40),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: onBackPressed,
              ),
            ),
            _buildInputField("Name", screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildInputField("E-Mail I.D.", screenWidth),
            SizedBox(height: screenHeight * 0.02),
            _buildTextArea("Enter message", screenWidth),
            SizedBox(height: screenHeight * 0.04),
            _buildSubmitButton(screenWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String placeholder, double screenWidth) {
    return TextField(
      style: TextStyle(color: Color(0xFFFF5900)),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(color: Color(0xFF9B725B)),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF5900)),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF5900)),
        ),
      ),
    );
  }

  Widget _buildTextArea(String placeholder, double screenWidth) {
    return TextField(
      maxLines: 4,
      style: TextStyle(color: Color(0xFFFF5900)),
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(color: Color(0xFF9B725B)),
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF5900)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFF5900)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(double screenWidth) {
    return GestureDetector(
      onTap: () {
        print("Submit button clicked!");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: screenWidth * 0.2), // Adjust horizontal padding
        decoration: BoxDecoration(
          color: Color(0xFFFF5900),
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.transparent, width: 2),
        ),
        child: Text(
          "Submit",
          style: TextStyle(
            fontSize: screenWidth * 0.045, // Responsive font size
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}



