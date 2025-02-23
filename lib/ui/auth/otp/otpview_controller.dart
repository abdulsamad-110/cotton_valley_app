import 'package:cotton_valley_app/ui/auth/change_password/change_passwordview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../services/auth_services/auth_services.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/common_functions.dart';

class OtpviewController extends GetxController {
  //
  TextEditingController otp = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController otpcontroller1 = TextEditingController();
  TextEditingController otpcontroller2 = TextEditingController();
  TextEditingController otpcontroller3 = TextEditingController();
  TextEditingController otpcontroller4 = TextEditingController();
  TextEditingController otpcontroller5 = TextEditingController();
  TextEditingController otpcontroller6 = TextEditingController();

  ///// OTP verify
  otpVerify() async {
    final error = fieldValidation();
    if (error != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          CommonFunctions.customSnackBar(
              title: error, color: AppColors.redColor));
      return;
    }

    final data = await AuthServices.otpVerify(
        email: emailController.text, otp: int.parse(otp.text));
    if (data != null) {
      Get.to(const ChangePasswordview());
    }
  }

  fieldValidation() {
    String? error;
    otp.text = otpcontroller1.text +
        otpcontroller2.text +
        otpcontroller3.text +
        otpcontroller4.text +
        otpcontroller5.text +
        otpcontroller6.text;
    if (otp.text.length < 6) {
      error = "Please enter valid OTP";
      print('heelo 1');
      print("${otp.text} ====== >> otp length");
      print("${otpcontroller1.text} ====== >>single  otp length");
    } else if (int.tryParse(otp.text) == null) {
      error = "Please enter valid OTP";
      print('heelo 2');
    }
    return error;
  }

/////
  validateOtp() {
    String? error;
    if (otp.text.isEmpty) {
      error = "Please enter the complete OTP.";
    }
    return error;
  }

  ///// Clear fields
  clearTextFields() {
    otpcontroller1.clear();
    otpcontroller2.clear();
    otpcontroller3.clear();
    otpcontroller4.clear();
    otpcontroller5.clear();
    otpcontroller6.clear();
  }
}
