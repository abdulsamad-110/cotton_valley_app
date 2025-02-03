import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_style.dart';


class MycustomButton extends StatelessWidget {
  final String title;
  final double? width;
  final double? height;
  final Color? backgroundColor;
 final double? borderRadius;
 final bool? isLoader;
  final void Function()? onPressed;
  final TextStyle? titleTextStyle;
  final bool hasBorder; // To control whether to show border or not
  final Color? borderColor; // Customizable border color
  final List<BoxShadow>? boxShadow; // New box shadow property

  const MycustomButton({
    Key? key,
    required this.title,
    this.width,
    this.height,
    this.backgroundColor,
    this.borderRadius ,
    this.titleTextStyle,
    this.hasBorder = false,
    this.borderColor,
    this.boxShadow,
    required this.onPressed, this.isLoader,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.redColor,
    // const Color(0xff346175), // Default color if not provided
        minimumSize: Size(width ?? 375.w, height ?? 52.h),
        shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(borderRadius ??10.r),
          side: hasBorder
              ? BorderSide(color: borderColor ?? AppColors.whiteColor)
              : BorderSide.none, // Optional border based on `hasBorder`
        ),
      ),
      child:isLoader==true ? CircularProgressIndicator() : Text(
        title,
        style: titleTextStyle ??
            AppTextStyles.popBoldbt14, // Default or custom text style
      ),
    );
  }
}
