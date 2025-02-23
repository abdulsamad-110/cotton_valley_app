// import 'package:cotton_valley_app/utils/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// import '../utils/app_colors.dart';

// void SortBottomSheet(
//   BuildContext context, {
//   required String title,
//   required String firstOption,
//   required String secondOption,
//   Widget? icon,
// }) {
//   showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return FractionallySizedBox(
//         alignment: Alignment.center,
//         widthFactor: 1.0, // Full screen width
//         child: Container(
//           height: 170.h,
//           width: 375.w,
//           decoration: BoxDecoration(
//             color: AppColors.whiteColor,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(20), 
//               topRight: Radius.circular(20), 
//             ),
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 // ✅ Title
//                 Text(
//                   title,
//                   style: AppTextStyles.popRegular14,
//                 ),
//                 const SizedBox(height: 8),

               
//                 Row(
//                   children: [
//                     SizedBox(
//                         width: icon != null ? 24 : 0), 
//                     if (icon != null) icon, 
//                     if (icon != null)
//                       SizedBox(width: 8), 
//                     Text(
//                       firstOption,
//                       style: AppTextStyles.popRegular10,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8.h),

                
//                 Row(
//                   children: [
//                     SizedBox(
//                         width: icon != null
//                             ? 24
//                             : 0), 
//                     Text(
//                       secondOption,
//                       style: AppTextStyles.popRegular10,
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 8.h),
//               ],
//             ),
//           ),
//         ),
//       );
//     },
//   );
// }
