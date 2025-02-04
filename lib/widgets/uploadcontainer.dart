import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class UploadContainer extends StatelessWidget {
  final String label;
  final String content;

  const UploadContainer({
    Key? key,
    required this.label,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Label text (Title text just like CustomTextField)
        Text(
          label,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4.h),

        /// Container with content
        Container(
          width: 120.w,
          height: 100.h,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: AppColors.lightgreyColor,
            borderRadius: BorderRadius.circular(8.r),
            // border: Border.all(color: Colors.grey),
          ),
          child: Center(
            child: Text(
              content,
              style: AppTextStyles.popRegular12,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
