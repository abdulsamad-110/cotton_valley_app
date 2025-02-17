import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class CustomDropdown extends StatelessWidget {
  final String? titleText;
  final String? hintText;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final bool showBorder;
  final TextEditingController? controller;
  final TextStyle? hintTextStyle;
  final TextStyle? titleTextStyle; // New optional parameter

  const CustomDropdown({
    super.key,
    this.titleText,
    this.hintText,
    this.onTap,
    this.height,
    this.width,
    this.showBorder = true,
    this.controller,
    this.hintTextStyle,
    this.titleTextStyle, // Optional style for title text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...[
          Text(
            titleText!,
            style: titleTextStyle ?? AppTextStyles.popRegular14, // Optional style
          ),
          SizedBox(height: 5.h),
        ],
        GestureDetector(
          onTap: onTap ?? () => print("Dropdown tapped!"),
          child: Container(
            height: height ?? 32.h,
            width: width ?? 100.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
              color: AppColors.lightgreyColor,
              border: showBorder ? Border.all(color: Colors.grey) : null,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    controller?.text.isNotEmpty == true
                        ? controller!.text
                        : hintText ?? "Select",
                    style: controller?.text.isNotEmpty == true
                        ? TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )
                        : hintTextStyle ?? AppTextStyles.popRegular10, // Optional hintTextStyle
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
