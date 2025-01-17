import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  bool _isPromoVisible = true; // Variable to control the visibility of the promo banner

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student ID: 123456'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
        ],
      ),
      body: Column(
        children: [
          // Logo at the top
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/college.png', // Ensure correct logo path
                  height: 200,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome to College Community',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          // Grid section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildFeatureCard(Icons.attach_money, 'Submit Deposit'),
                  _buildFeatureCard(Icons.event, 'Admission Events'),
                  _buildFeatureCard(Icons.checklist, 'Admitted Checklist'),
                  _buildFeatureCard(Icons.task, 'Get Stuff Done'),
                  _buildFeatureCard(Icons.school, 'Our Programs'),
                  _buildFeatureCard(
                      Icons.attach_money_rounded, 'Affordability'),
                  _buildFeatureCard(Icons.emoji_emotions, 'Experience'),
                  _buildFeatureCard(Icons.location_on, 'Back to Campus'),
                ],
              ),
            ),
          ),
          // Promo banner with a student picture, now removable
          if (_isPromoVisible) _buildPromoBanner(context),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        // Add navigation or feature action here
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.blue,
            child: Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPromoBanner(BuildContext context) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Join us for',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Student Night',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Come see what being a student is all about!',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
          // Add student picture in the promo banner
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(
              'assets/images/college.png', // Ensure correct student image path
            ),
          ),
          // Close button to remove promo banner
          IconButton(
            onPressed: () {
              setState(() {
                _isPromoVisible = false; // Hide the promo banner
              });
            },
            icon: const Icon(Icons.close, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
