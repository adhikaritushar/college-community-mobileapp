import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Gradient
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.purpleAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Center(
                  child: Image.asset(
                    'assets/images/college.png', // Ensure to replace with the correct path to your logo
                    width: 250,
                    height: 250,
                  ),
                ),
                const SizedBox(height: 30),
                // Name TextField
                _buildTextField(
                  label: 'Name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                // Email TextField
                _buildTextField(
                  label: 'Email',
                  icon: Icons.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),
                // Password TextField
                _buildTextField(
                  label: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 30),
                // Sign Up Button
                ElevatedButton(
                  onPressed: () {
                    // Handle sign-up action
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sign-up button clicked!')),
                    );

                    // Navigate back to LoginView
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper widget for TextField
  Widget _buildTextField({
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.white),
        ),
        prefixIcon: Icon(icon, color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
      ),
    );
  }
}
