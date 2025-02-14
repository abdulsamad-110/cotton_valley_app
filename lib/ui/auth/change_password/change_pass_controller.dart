import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class ChangepasswordController extends GetxController {
  final newpasswordController = TextEditingController();
  final confrimnewpassController = TextEditingController();

  RxBool isNewPassHidden = true.obs;
  RxBool isConfrimNewPassHidden = true.obs;
  /////
  toggleNewPassword() {
    isNewPassHidden.value = !isNewPassHidden.value;
  }

  toggleConfrimNewPassword() {
    isConfrimNewPassHidden.value = !isConfrimNewPassHidden.value;
  }

   ///// Validation
  fieldValidation() {
    String? error;
    if (newpasswordController.text.isEmpty) {
      error = 'New password is required.';
    } else if (confrimnewpassController.text.isEmpty) {
      error = 'Confirm new password is required.';
    } else if (newpasswordController.text != confrimnewpassController.text) {
      error = 'Passwords do not match.';
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


  @override
  void onInit() {
    // isPassHidden.value = true;
    super.onInit();
  }
}
