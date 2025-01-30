import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double width;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black, 
    this.textColor = Colors.white, // Default color
    this.borderRadius = 10.0,
    this.width = 315, // Default width
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w, // Responsive width
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor, // Dynamic background color
          foregroundColor: textColor, // Dynamic text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius.r), // Responsive border radius
          ),
          padding: EdgeInsets.symmetric(
              vertical: 15.h), // Responsive vertical padding
        ),
        child: Text(text, style: AppTextStyles.popBoldbt14),
      ),
    );
  }
}
