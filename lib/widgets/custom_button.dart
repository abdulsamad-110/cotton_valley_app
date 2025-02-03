import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final TextStyle textStyle;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    this.borderRadius = 10.0,
    this.textStyle = const TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold), // Default textStyle
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 315.w, // Fixed width
      height: 40.h, // Fixed height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
