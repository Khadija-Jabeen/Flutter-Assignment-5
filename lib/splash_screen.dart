import 'dart:async';
import 'package:flutter/material.dart';
import 'walkthrough_screen.dart'; // Import the HomeScreen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the HomeScreen after 10 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WalkThrough()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'), // Replace with your image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blue overlay with opacity
          Container(
            color: const Color.fromARGB(255, 3, 74, 133).withOpacity(0.9), // Adjust the opacity as needed
          ),
          // Content over the background
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 60, // Adjust the size of the logo
                  backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your logo
                ),
                SizedBox(height: 20), // Spacing between logo and text
                Text(
                  'Quick Medical',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Adjust text color if needed
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
