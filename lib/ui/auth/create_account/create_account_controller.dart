import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateAccountController extends GetxController{

  TextEditingController fullNameController = TextEditingController();
  TextEditingController companyNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController createPassController = TextEditingController();

  RxBool isCreatePassHidden = true.obs;
  /////
  void toggleCreatePassword() {
    isCreatePassHidden.value = !isCreatePassHidden.value;
  }

  ///// Clear fields
  clearTextFields() {
    
    emailController.clear();
    createPassController.clear();
  }

  ///// Validation 
  fieldValidation() {
    String? error;
    if (fullNameController.text.isEmpty) {
      error = 'Full Name is required.';
    } else if (companyNameController.text.isEmpty) {
      error = 'Company Name is required.';
    } else if (emailController.text.isEmpty) {
      error = 'Email is required.';
    } else if (createPassController.text.isEmpty) {
      error = 'Password is required.';
    }
    return error;
  }
}