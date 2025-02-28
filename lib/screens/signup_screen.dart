import 'package:edc_app/models/userModel.dart';
import 'package:flutter/material.dart';
import 'package:edc_app/screens/signin_screen.dart';
import 'package:flutter/services.dart';
import 'package:edc_app/models/usermodel.dart'; // Import the model

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _collegeController = TextEditingController();

  void _signUp() {
    // Validate inputs
    if (_phoneController.text.length != 10) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter a valid 10-digit phone number")),
      );
      return;
    }

    // Create a new user object
    Usermodel newUser = Usermodel(
      fullName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text, 
      phoneNumber: _phoneController.text.trim(),// Ideally, hash before sending
      college: _collegeController.text.trim().isNotEmpty ? _collegeController.text.trim() : null,
    );

    // Convert user to JSON
    String userJson = newUser.toJsonString();
    print("User Data: $userJson");

    // Here, you would send `userJson` to an API
    // For now, navigate to login screen
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset("assets/images/bg-theme.png", fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.4)),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Create an Account", style: TextStyle(fontSize: width * 0.08, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: height * 0.03),

                  _buildInputField(_nameController, "Full Name"),
                  SizedBox(height: height * 0.015),
                  _buildInputField(_emailController, "Email"),
                  SizedBox(height: height * 0.015),
                  _buildInputField(_phoneController, "Phone Number", isPhone: true),
                  SizedBox(height: height * 0.015),
                  _buildInputField(_passwordController, "Password", isPassword: true),
                  SizedBox(height: height * 0.015),
                  _buildInputField(_collegeController, "College"),
                  SizedBox(height: height * 0.02),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.3),
                    ),
                    onPressed: _signUp,
                    child: Text("SIGN UP", style: TextStyle(fontSize: width * 0.045, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: height * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?", style: TextStyle(color: Colors.white70)),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                        },
                        child: Text("SIGN IN", style: TextStyle(color: Color(0xFF3A77FA), fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText, {bool isPassword = false, bool isPhone = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
      inputFormatters: isPhone ? [FilteringTextInputFormatter.digitsOnly] : [],
      maxLength: isPhone ? 10 : null,
      decoration: InputDecoration(
        hintText: hintText,
        counterText: "",
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}