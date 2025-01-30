import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreatePasswordviewController extends GetxController {
  final passwordController = TextEditingController();
  final confrimPassController = TextEditingController();

  RxBool isPassHidden = true.obs;
  RxBool isConfrimPassHidden = true.obs;
  /////
  void togglePassword() {
    isPassHidden.value = !isPassHidden.value;
  }

  void toggleConfrimPassword() {
    isConfrimPassHidden.value = !isConfrimPassHidden.value;
  }

  @override
  void onInit() {
    super.onInit();
  }
}
