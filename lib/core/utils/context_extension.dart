import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get screenHeight => MediaQuery.sizeOf(this).height;

  double get screenWidth => MediaQuery.sizeOf(this).width;

  EdgeInsets get viewPadding => MediaQuery.of(this).viewPadding;

  Brightness get platformBrightness => MediaQuery.of(this).platformBrightness;
}
