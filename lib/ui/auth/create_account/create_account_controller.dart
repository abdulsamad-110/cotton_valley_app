import 'package:cotton_valley_app/services/auth_services/auth_services.dart';
import 'package:cotton_valley_app/ui/auth/sign_in/signin_view.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController createPassController = TextEditingController();

  ///// Sign Up Post Api
  signupRequest() async {
    final error = fieldValidation();
    if (error != null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
          CommonFunctions.customSnackBar(
              title: error, color: AppColors.redColor));
      return;
    }
    final data = await AuthServices.signupRequest(
        name: fullNameController.text,
        companyName: companyNameController.text,
        email: emailController.text,
        password: createPassController.text,
        confirmPassword: createPassController.text);
    if (data != null) {
      Get.off(const SigninView());
    }
    return null;
  }

  fieldValidation() {
    String? error;
    if (fullNameController.text.isEmpty &&
        companyNameController.text.isEmpty &&
        emailController.text.isEmpty &&
        createPassController.text.isEmpty) {
      error = 'All fields are required.';
    } else if (fullNameController.text.isEmpty) {
      error = 'Full Name is Required.';
    } else if (companyNameController.text.isEmpty) {
      error = 'Company Name is Required.';
    } else if (emailController.text.isEmpty) {
      error = 'Email is Required.';
    } else if (createPassController.text.isEmpty) {
      error = 'Password is Required.';
    }
    return error;
  }

  RxBool isCreatePassHidden = true.obs;
  /////
  void toggleCreatePassword() {
    isCreatePassHidden.value = !isCreatePassHidden.value;
  }

  ///// Clear fields
  clearTextFields() {
    fullNameController.clear();
    companyNameController.clear();
    emailController.clear();
    createPassController.clear();
  }

  // ///// Validation
  // fieldValidation() {
  //   String? error;
  //   if (fullNameController.text.isEmpty) {
  //     error = 'Full Name is required.';
  //   } else if (companyNameController.text.isEmpty) {
  //     error = 'Company Name is required.';
  //   } else if (emailController.text.isEmpty) {
  //     error = 'Email is required.';
  //   } else if (createPassController.text.isEmpty) {
  //     error = 'Password is required.';
  //   }
  //   return error;
  // }

  @override
  void onInit() {
    super.onInit();
  }
}
