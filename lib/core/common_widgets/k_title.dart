import 'package:flutter/material.dart';

class KTitle extends StatelessWidget {
  final String title;
  final Color containerColor;

  const KTitle({
    super.key,
    required this.title,
    this.containerColor = Colors.red, // Default container color is red
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 24,
          width: 5,
          color: containerColor, // Dynamic container color
          margin: const EdgeInsets.only(right: 8),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
