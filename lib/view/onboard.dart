import 'package:flutter/material.dart';
import 'login.dart'; // Import LoginView from the view folder
import 'package:google_fonts/google_fonts.dart';

class OnboardView extends StatelessWidget {
  const OnboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: const [
          OnboardPage(
            title: 'Welcome to College Community',
            description: 'Connect, communicate, and collaborate.',
            imagePath: 'assets/images/student1.png',
            backgroundColor: Colors.blueAccent,
          ),
          OnboardPage(
            title: 'Simplify Queries',
            description: 'Post and answer queries with ease.',
            imagePath: 'assets/images/student2.png',
            backgroundColor: Colors.greenAccent,
          ),
          OnboardPage(
            title: 'Stay Updated',
            description: 'Get real-time updates from your college.',
            imagePath: 'assets/images/student3.png',
            backgroundColor: Colors.purpleAccent,
          ),
        ],
      ),
    );
  }
}

class OnboardPage extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Color backgroundColor;

  const OnboardPage({
    required this.title,
    required this.description,
    required this.imagePath,
    required this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image
            Image.asset(
              imagePath,
              width: 300,
              height: 300,
            ),
            const SizedBox(height: 30),
            // Title
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
// Description
            Text(
              description,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            // Get Started Button (only on the last page)
            if (title == 'Stay Updated')
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginView(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 15,
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
