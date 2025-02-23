import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/mycustom_bottomsheet.dart';

void SortBottomSheet(
  BuildContext context, {
  required String title,
  required String firstOption,
  required String secondOption,
  VoidCallback? onFirstOptionTap,
  VoidCallback? onSecondOptionTap,
  Widget? icon,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (_) {
      return CustomBottomSheet(
        height: 180.h,
        myWidget: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title, style: AppTextStyles.popBold14),
              SizedBox(height: 12.h),

              // ✅ First Option
              GestureDetector(
                onTap: onFirstOptionTap,
                child: Row(
                  children: [
                    if (icon != null) ...[
                      icon,
                      SizedBox(width: 10.w),
                    ],
                    Text(firstOption, style: AppTextStyles.popRegular10),
                  ],
                ),
              ),

              SizedBox(height: 12.h),

              // ✅ Second Option
              GestureDetector(
                onTap: onSecondOptionTap,
                child: Row(
                  children: [
                    if (icon != null) ...[
                      SizedBox(width: 34.w),
                    ],
                    Text(secondOption, style: AppTextStyles.popRegular10),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
// import 'package:cotton_valley_app/widgets/mycustom_bottomsheet.dart';
// import 'package:flutter/material.dart';

// class SortBottomsheet extends StatelessWidget {

//   const SortBottomsheet({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return CustomBottomSheet(myWidget: Expanded(child: Text("data")));
//   }
// }