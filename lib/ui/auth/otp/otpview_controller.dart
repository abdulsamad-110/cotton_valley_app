import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

class OtpviewController extends GetxController {
  TextEditingController otpcontroller1 = TextEditingController();
  TextEditingController otpcontroller2 = TextEditingController();
  TextEditingController otpcontroller3 = TextEditingController();
  TextEditingController otpcontroller4 = TextEditingController();
  TextEditingController otpcontroller5 = TextEditingController();
  TextEditingController otpcontroller6 = TextEditingController();

/////
  validateOtp() {
    String? error;
    if (otpcontroller1.text.isEmpty ||
        otpcontroller2.text.isEmpty ||
        otpcontroller3.text.isEmpty ||
        otpcontroller4.text.isEmpty ||
        otpcontroller5.text.isEmpty ||
        otpcontroller6.text.isEmpty) {
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
