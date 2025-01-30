import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangepasswordController extends GetxController {
  final newpasswordController = TextEditingController();
  final confirmnewpassController = TextEditingController();

  RxBool isNewPassHidden = true.obs;
  RxBool isConfrimNewPassHidden = true.obs;
  /////
  toggleNewPassword() {
    isNewPassHidden.value = !isNewPassHidden.value;
  }

  toggleConfirmNewPassword() {
    isConfrimNewPassHidden.value = !isConfrimNewPassHidden.value;
  }

  @override
  void onInit() {
    // isPassHidden.value = true;
    super.onInit();
  }
}
