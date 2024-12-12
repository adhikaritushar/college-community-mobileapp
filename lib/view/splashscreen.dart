import 'package:flutter/material.dart';
import './onboard.dart'; // Import the OnboardView

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SplashscreenView(),
    );
  }
}

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
      backgroundColor: Colors.blue,
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
            const Text(
              'College Community',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
