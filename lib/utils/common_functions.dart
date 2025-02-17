import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunctions {
  ///// Show SnackBar Message
 static showMessage({required String title, required String message, required Color color}) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: color,
    colorText: AppColors.whiteColor,
    snackPosition: SnackPosition.TOP,
    duration: const Duration(seconds: 3),
  );
}

}
