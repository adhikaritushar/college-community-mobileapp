// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:college_community/config/theme/app_colors.dart';
import 'package:college_community/config/theme/text_style.dart';
import 'package:flutter/material.dart';

class KElevatedButton extends StatelessWidget {
  final String label;
  final Color? labelColor;
  final double? labelFontSize;
  final FontWeight? labelFontWeight;
  final VoidCallback onPressed;
  final Color color;
  final Color? bgColor;
  final Color? forgroundColor;
  final double elevation;
  final double borderRadius;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry padding;
  final double buttonHeight;
  final double? buttonWidget;
  final bool isLoading;

  const KElevatedButton({
    super.key,
    required this.label,
    this.labelColor,
    this.labelFontSize,
    this.labelFontWeight,
    required this.onPressed,
    this.color = Colors.white,
    this.bgColor = AppColors.primaryColor,
    this.forgroundColor = Colors.white,
    this.elevation = 4.0,
    this.borderRadius = 8.0,
    this.textStyle,
    this.padding = const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    this.buttonHeight = 60,
    this.buttonWidget,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        foregroundColor: forgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: isLoading
          ? const SizedBox(height: 20, child: CircularProgressIndicator(color: Colors.white))
          : Text(
              label,
              style: AppTextStyle.textStyle(
                context: context,
                fontSize: labelFontSize ?? 16,
                fontWeight: labelFontWeight ?? FontWeight.w500,
                color: color,
              ),
            ),
    );
  }
}
