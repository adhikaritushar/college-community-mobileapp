import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double elevation;
  final List<Widget> actions; // Added actions

  const KAppBar({
    super.key,
    required this.title,
    this.elevation = 4.0, // Default elevation
    this.actions = const [], // Default empty list of actions
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white, // White text color
        ),
      ),
      backgroundColor: Colors.blue.shade900, // Blue background color
      elevation: elevation,
      actions: actions, // Set actions here
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
