import 'package:college_community_main/features/splash/presentation/view_model/splashscreen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../onboarding/presentation/view/onboard.dart'; // Import the OnboardView
import 'package:google_fonts/google_fonts.dart';

class SplashscreenView extends StatelessWidget {
  const SplashscreenView({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the Cubit
    final splashscreenCubit = SplashscreenCubit();

    // Trigger navigation
    splashscreenCubit.navigateToOnboardView(context);

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
