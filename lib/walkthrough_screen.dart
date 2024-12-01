import 'package:flutter/material.dart';
import 'login.dart'; // Import the LoginPage or desired screen to navigate

class WalkThrough extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // White background
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(height: 60), // Top spacing
          // Walkthrough image
          Image.asset(
            'assets/images/walkthrough.png',
            width: 250, // Adjusted size for the image
            height: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 15), // Spacing between the image and content
          // Walkthrough content
          Column(
            children: const [
              Text(
                'View and buy\nMedicine online',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87, // Dark text color for the title
                ),
              ),
              SizedBox(height: 8), // Spacing between the title and subtitle
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0), // Horizontal padding
                child: Text(
                  'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey, // Subtle text color for the subtitle
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10), // Spacing between content and indicators
          // Navigation Indicators
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: index == 1 ? 10 : 8, // Highlight the second dot
                    height: index == 1 ? 10 : 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 1 ? Colors.blue : Colors.grey, // Active/Inactive color
                    ),
                  );
                }),
              ),
              const SizedBox(height: 40), // Reduced spacing before bottom buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigate to Login screen when skipping
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey, // Subtle color for Skip button
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to Login screen when clicking next
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: const Text(
                        'Next',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue, // Blue color for Next button
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
