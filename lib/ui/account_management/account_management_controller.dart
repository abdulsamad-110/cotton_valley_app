import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class AccountManagementController extends GetxController {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmNewPassController = TextEditingController();

  RxBool isCurrentPassHidden = true.obs;
  RxBool isNewPassHidden = true.obs;
  RxBool isConfirmNewPassHidden = true.obs;

  ///// Function
  void clearTextFields() {
    firstNameController.clear();
    lastNameController.clear();
    phoneController.clear();
    emailController.clear();
    currentPassController.clear();
    newPassController.clear();
    confirmNewPassController.clear();
  }

  ///// Toggle Functions
  void toggleCurrentPassword() {
    isCurrentPassHidden.value = !isCurrentPassHidden.value;
  }

  void toggleNewPassword() {
    isNewPassHidden.value = !isNewPassHidden.value;
  }

  void toggleConfirmNewPassword() {
    isConfirmNewPassHidden.value = !isConfirmNewPassHidden.value;
  }
}
