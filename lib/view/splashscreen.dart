import 'package:flutter/material.dart';
import './onboard.dart'; // Import the OnboardView
import 'package:google_fonts/google_fonts.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to OnboardView after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardView()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add logo here
            Image.asset(
              'assets/images/college.png', // Make sure to replace with the correct path to your logo
              width: 250, // Adjust the size of the logo
              height: 250,
            ),
            const SizedBox(height: 20),
            Text(
              'College Community',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
