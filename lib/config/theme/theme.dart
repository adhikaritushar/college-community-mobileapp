import 'package:flutter/material.dart';

ThemeData appTheme({
  required BuildContext context,
  required ColorScheme colorScheme,
  required Color scaffoldBackgroundColor,
}) {
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    fontFamily: 'Roboto',
    scaffoldBackgroundColor: scaffoldBackgroundColor,
  );
}

ThemeData darkTheme(BuildContext context) {
  return appTheme(
    scaffoldBackgroundColor: const Color(0xff0a0a0a),
    context: context,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );
}

ThemeData lightTheme(BuildContext context) {
  return appTheme(
    scaffoldBackgroundColor: const Color(0xfffcfcfc),
    context: context,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );
}
