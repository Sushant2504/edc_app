import 'package:flutter/material.dart';
import 'package:edc_app/screens/signup_screen.dart';
import 'package:flutter/services.dart';
import 'package:edc_app/models/usermodel.dart'; // Import the model

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Create a dummy user object (Replace this with actual API authentication)
    Usermodel loginUser = Usermodel(
      id: "",
      fullName: "",
      email: _emailController.text.trim(),
      phoneNo: "",
      college: "",
      password: _passwordController.text.trim(),
    );

    // Convert to JSON and print (Replace this with API call)
    String userJson = loginUser.toJsonString();
    print("Login Data: $userJson");

    // Navigate to Signup Screen (or Dashboard)
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignupScreen()));
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
                  Text("Welcome Back", style: TextStyle(fontSize: width * 0.08, fontWeight: FontWeight.bold, color: Colors.white)),
                  SizedBox(height: height * 0.03),

                  _buildInputField(_emailController, "Email"),
                  SizedBox(height: height * 0.015),
                  _buildInputField(_passwordController, "Password", isPassword: true),
                  SizedBox(height: height * 0.015),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      padding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: width * 0.3),
                    ),
                    onPressed: _login,
                    child: Text("LOGIN", style: TextStyle(fontSize: width * 0.045, color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField(TextEditingController controller, String hintText, {bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
    );
  }
}