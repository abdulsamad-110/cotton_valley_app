// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../utils/app_colors.dart';
// import '../utils/text_style.dart';

// class CustomDropdown extends StatelessWidget {
//   final String? titleText;
//   final String? hintText;
//   final VoidCallback? onTap;
//   final double? height;
//   final double? width;
//   final bool showBorder;

//   const CustomDropdown({
//     super.key,
//     this.titleText,
//     this.hintText,
//     this.onTap,
//     this.height,
//     this.width,
//     this.showBorder = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (titleText != null) ...[
//           Text(
//             titleText!,
//             style: AppTextStyles.popRegular14,
//           ),
//           SizedBox(height: 5.h),
//         ],
//         GestureDetector(
//           onTap: onTap ?? () => print("Dropdown tapped!"),
//           child: Container(
//             height: height ?? 32.h,
//             width: width ?? 100.w,
//             padding: EdgeInsets.symmetric(horizontal: 8.w),
//             decoration: BoxDecoration(
//               color: AppColors.lightgreyColor,
//               border: showBorder ? Border.all(color: Colors.grey) : null,
//               borderRadius: BorderRadius.circular(6.r),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Expanded(
//                   child: Text(
//                     hintText ?? "Select",
//                     style: TextStyle(
//                       color: AppColors.blackColor,
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w500,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 const Icon(Icons.arrow_drop_down, color: Colors.black),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
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
  final TextStyle? hintTextStyle; // ✅ Added optional hint text style

  const CustomDropdown({
    super.key,
    this.titleText, // ✅ Optional Title
    this.hintText,
    this.onTap,
    this.height,
    this.width,
    this.showBorder = true,
    this.controller, // ✅ Added Controller
    this.hintTextStyle, // ✅ Optional hint text style
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (titleText != null) ...[
          Text(
            titleText!,
            style: AppTextStyles.popRegular14,
          ),
          SizedBox(height: 5.h),
        ],
        GestureDetector(
          onTap: onTap ??
              () {
                print("Dropdown tapped!");
              },
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
                        : hintText ??
                            "Select", // ✅ Uses controller text if available
                    style: controller?.text.isNotEmpty == true
                        ? TextStyle(
                            color: AppColors.blackColor,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          )
                        : hintTextStyle ??
                            TextStyle(
                              // ✅ Default hint text style
                              color: Colors.grey,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
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
