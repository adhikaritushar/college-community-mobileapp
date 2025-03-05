import 'package:flutter/material.dart';

void kShowSnackBar(BuildContext context, {required String message, Color? backgroundColor}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      content: Text(message),
    ),
  );
}
