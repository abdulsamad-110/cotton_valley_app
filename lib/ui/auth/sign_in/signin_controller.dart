import 'package:cotton_valley_app/services/auth_services/auth_services.dart';
import 'package:cotton_valley_app/ui/home/home_view.dart';
import 'package:cotton_valley_app/ui/navigation/navigation_view.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///// login function
  login() async {
    final error = fieldValidation();
    if (error != null) {
      Future.delayed(const Duration(microseconds: 100), () {
        CommonFunctions.showMessage(
          title: 'Error',
          msg: error,
          color: AppColors.redColor,
        );
      });
      return;
    }
    final data = await AuthServices.logInRequest(
      email: emailController.text,
      password: passwordController.text,
    );
    if (data != null) {
      await Get.offAll(NavigationView());
      Future.delayed(const Duration(microseconds: 100), () {
        CommonFunctions.showMessage(
          title: 'Success',
          msg: "Login successful",
          // message: 'Login successful',
          color: AppColors.redColor,
        );
      });
    }
  }

  RxBool isPassHidden = true.obs;
  /////
  void togglePassword() {
    isPassHidden.value = !isPassHidden.value;
  }

  ///// Clear fields
  clearTextFields() {
    emailController.clear();
    passwordController.clear();
  }

  ///// Validation for email and password
  fieldValidation() {
    String? error;
    if (emailController.text.isEmpty && passwordController.text.isEmpty) {
      error = 'All fields are required.';
    } else if (emailController.text.isEmpty) {
      error = 'Email is required.';
    } else if (passwordController.text.isEmpty) {
      error = 'Password is required.';
    }

    return error;
  }

  @override
  void onInit() {
    //clearTextFields();
    //isPassHidden.value = true;
    super.onInit();
  }
}
