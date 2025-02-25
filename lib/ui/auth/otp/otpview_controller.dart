// ignore_for_file: prefer_const_constructors

import 'package:cotton_valley_app/ui/account_management/account_management_view.dart';
import 'package:cotton_valley_app/ui/auth/booking_complete/booking_completeview.dart';
import 'package:cotton_valley_app/ui/auth/change_password/change_passwordview.dart';
import 'package:cotton_valley_app/ui/auth/select_your_plan/selectyour_planview.dart';
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

  FocusNode focus1 = FocusNode();
  FocusNode focus2 = FocusNode();
  FocusNode focus3 = FocusNode();
  FocusNode focus4 = FocusNode();
  FocusNode focus5 = FocusNode();
  FocusNode focus6 = FocusNode();

  ///// OTP verify
  otpVerify({required String email, required bool isSignup}) async {
    final error = fieldValidation();
    if (error != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          CommonFunctions.showMessage(
              title: 'Error', msg: error, color: AppColors.redColor));
      return;
    }

    final data =
        await AuthServices.otpVerify(email: email, otp: int.parse(otp.text));
    if (data != null) {
      if (isSignup == false) {
        print('isSignup1=====> $isSignup');
        Get.to(ChangePasswordview(
          access: data['token']['access'],
        ));
      } else {
        print('isSignup2=====> $isSignup');
        Get.offAll(SelectyourPlanview());
      }
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
