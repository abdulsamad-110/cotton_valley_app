import 'package:cotton_valley_app/ui/auth/otp/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_services/auth_services.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/common_functions.dart';

class FindaccountController extends GetxController {
  TextEditingController emailController = TextEditingController();

  ///// Forget password
  forgetPass() async {
    final error = fieldValidation();
    if (error != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          CommonFunctions.customSnackBar(
              title: error, color: AppColors.redColor));
      return;
    }
    final data = await AuthServices.forgetPass(email: emailController.text);
    if (data != null) {
      print('forgetPass=====>');
      Get.to(const OtpView());
    }
    return null;
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

///// Clear fields
  clearTextFields() {
    emailController.clear();
  }
  //@override
  // void onInit() {
  //   clearTextFields();
  //   super.onInit();
  // }
}
