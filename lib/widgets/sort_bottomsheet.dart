import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';

void SortBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return FractionallySizedBox(
        alignment: Alignment.center,
        widthFactor: 1.0, // Full screen width
        child: Container(
          height: 170.h,
          width: 375.w,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), // Set the top-left border radius
              topRight: Radius.circular(20), // Set the top-right border radius
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'SORT',
                  style: AppTextStyles.popRegular14,
                ),
                const SizedBox(height: 8),
                // Text items
                Text(
                  'Alphabetically',
                  style: AppTextStyles.popRegular10,
                ),
                SizedBox(height: 8.h),
                Text(
                  'No. of Products',
                  style: AppTextStyles.popRegular10,
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),
        ),
      );
    },
  );
}
