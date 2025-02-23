import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunctions {
  ///// Show SnackBar Message
  static showMessage(
      {required String title, required Color color, required String msg}) {
    return Get.snackbar(
      title,
      msg,
      backgroundColor: color,
      colorText: AppColors.whiteColor,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }
  static customSnackBar({required String title, required Color color}) {
    return SnackBar(
      content: Text(title,
          style: AppTextStyles.popLight16
              .copyWith(color: AppColors.whiteColor, fontSize: 16)),
      backgroundColor: color,
      // behavior: SnackBarBehavior.floating,
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(10),
      // ),
      duration: const Duration(seconds: 3),
      // animation: CustomSnackBarAnimation().createAnimationController(),
    );
}
//  static flushBarSuccessMessage({required String msg}){
//     showFlushbar(
//         context: Get.context!,
//         flushbar: Flushbar(
//           forwardAnimationCurve: Curves.decelerate,
//           margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
//           padding: EdgeInsets.all(15.r),
//           message: msg,
//           messageColor: AppColors.whitecolor,
//           duration: const Duration(seconds: 3),
//           flushbarPosition: FlushbarPosition.TOP,
//           backgroundColor: AppColors.greeycolor,
//           reverseAnimationCurve: Curves.easeInOut,
//           positionOffset: 20,
//           borderRadius: BorderRadius.circular(12.r),
//           icon: Icon(Icons.check_circle,size: 20.r,color: AppColors.whitecolor,),
//           // icon: icon,
//         )..show(Get.context!)
//     );
//   }
// static flushBarErrorMessage({
//     required String msg,
//   }){
//     showFlushbar(
//         context: Get.context!,
//         flushbar: Flushbar(
//           forwardAnimationCurve: Curves.decelerate,
//           margin: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
//           padding: EdgeInsets.all(15.r),
//           message: msg,
//           duration: const Duration(seconds: 3),
//           flushbarPosition: FlushbarPosition.TOP,
//           backgroundColor: AppColors.redcolor,
//           reverseAnimationCurve: Curves.easeInOut,
//           positionOffset: 20,
//           messageColor: AppColors.whitecolor,
//           borderRadius: BorderRadius.circular(12.r),
//           icon: Icon(Icons.error_outline,size: 20.r,color: AppColors.whitecolor,),
//           // icon: icon,
//         )..show(Get.context!)
//     );
// }
}
