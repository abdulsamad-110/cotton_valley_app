import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunctions {
  ///// Show SnackBar Message
  static showMessage(String title, String message, Color color) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: color,
      colorText: AppColors.whiteColor,
      snackPosition: SnackPosition.TOP,
    );
  }
}
