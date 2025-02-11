import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Widget? leadingIcon;
  final double? width; // Optional width
  final double? height; // Optional height
  final Color? backgroundColor; // Optional background color
  final TextStyle? titleTextStyle; // Optional title text style

  const ProductCustomButton({
    Key? key,
    required this.onTap,
    this.title = 'keyword',
    this.leadingIcon,
    this.width, // Optional parameter
    this.height, // Optional parameter
    this.backgroundColor, // Optional background color
    this.titleTextStyle, // Optional title text style
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: width ?? 60.w, // Default width if not provided
        height: height ?? 20.h, // Default height if not provided
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ??
                AppColors.redColor, // Default color if not provided
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  leadingIcon!,
                  SizedBox(width: 3.w),
                ],
                Text(
                  title,
                  style: titleTextStyle ??
                      AppTextStyles
                          .popWhite8, // Default text style if not provided
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
