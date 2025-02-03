import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title; // Allow dynamic title

  const ProductCustomButton({
    Key? key,
    required this.onTap,
    this.title = 'keyword', // Default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 47.w,
        height: 20.h,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.circular(6.r), // Making it responsive
          ),
          child: Center(
            child: Text(
              title,
              style: AppTextStyles.popWhite8,
            ),
          ),
        ),
      ),
    );
  }
}
