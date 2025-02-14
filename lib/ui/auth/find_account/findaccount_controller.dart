import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class FindaccountController extends GetxController{
  TextEditingController emailController = TextEditingController();

  ///// Clear fields
  clearTextFields() {
    emailController.clear();
  }

   ///// Validation for email
  fieldValidation() {
    String? error;
    if (emailController.text.isEmpty) {
       error = 'Email is required.';
    // } else if (passwordController.text.isEmpty) {
    //   error = 'Password is required.';
    }
    return error;
  }

  ///// Validation massage
  void showMessage(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: AppColors.whiteColor,
    );
  }



  //@override
  // void onInit() {
  //   clearTextFields();
  //   super.onInit();
  // }
 
}