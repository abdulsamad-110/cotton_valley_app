import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool isPassHidden = true.obs;
  /////
  void togglePassword() {
    isPassHidden.value = !isPassHidden.value;
  }

  ///// Clear fields
  clearTextFields() {
    emailController.clear();
    passwordController.clear();
    isPassHidden.value = true;
  }

  // ///// Clear Fields and Reset Toggle
  // void resetFields() {
  //   emailController.clear();
  //   passwordController.clear();
  //   isPassHidden.value = true;
  // }

  ///// Validation for email and password
  fieldValidation() {
    String? error;
    if (emailController.text.isEmpty) {
      error = 'Email is required.';
    } else if (passwordController.text.isEmpty) {
      error = 'Password is required.';
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
      colorText: Colors.white,
    );
  }

  @override
  void onInit() {
    clearTextFields();
    super.onInit();
  }
}
