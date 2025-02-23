import 'package:cotton_valley_app/ui/auth/sign_in/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/auth_services/auth_services.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/common_functions.dart';

class ChangepasswordController extends GetxController {
  final newpasswordController = TextEditingController();
  final confirmnewpassController = TextEditingController();

  ///// change password
  // changePass() async {
  //   final error = fieldValidation();
  //   if (error != null) {
  //     ScaffoldMessenger.of(Get.context!).showSnackBar(
  //         CommonFunctions.customSnackBar(
  //             title: error, color: AppColors.redColor));
  //     return;
  //   }
  //   final data = await AuthServices.changePass(
  //     newpassword: newpasswordController.text,
  //      confirmpassword: confirmnewpassController.text);
  //   if (data != null) {
  //     Get.to(const SigninView());
  //   }
  // }

  fieldValidation() {
    String? error;
    if (newpasswordController.text.isEmpty &&
        confirmnewpassController.text.isEmpty) {
      error = 'All fields are required.';
    } else if (newpasswordController.text.isEmpty) {
      error = 'Password is Required.';
    } else if (confirmnewpassController.text.isEmpty) {
      error = 'Confirm Password is Required.';
    } else if (newpasswordController.text != confirmnewpassController.text) {
      error = 'Passwords do not match.';
    }
    return error;
  }

  RxBool isNewPassHidden = true.obs;
  RxBool isConfrimNewPassHidden = true.obs;
  /////
  toggleNewPassword() {
    isNewPassHidden.value = !isNewPassHidden.value;
  }

  toggleConfrimNewPassword() {
    isConfrimNewPassHidden.value = !isConfrimNewPassHidden.value;
  }

  // ///// Validation
  // fieldValidation() {
  //   String? error;
  //   if (newpasswordController.text.isEmpty) {
  //     error = 'New password is required.';
  //   } else if (confrimnewpassController.text.isEmpty) {
  //     error = 'Confirm new password is required.';
  //   } else if (newpasswordController.text != confrimnewpassController.text) {
  //     error = 'Passwords do not match.';
  //   }
  //   return error;
  // }

  @override
  void onInit() {
    // isPassHidden.value = true;
    super.onInit();
  }
}
