import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle textStyle({
    required BuildContext context,
    double fontSize = 18,
    Color? color,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return GoogleFonts.poppins(
      fontSize: fontSize,
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontWeight: fontWeight,
    );
  }
}
