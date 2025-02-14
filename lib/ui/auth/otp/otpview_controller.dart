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

  ///// Validate OTP
  validateOtp() {
    String? error;
    //
    return error;
  }

  ///// validation message
  void showMessage(String title, String message, Color backgroundColor) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: backgroundColor,
      colorText: AppColors.whiteColor,
    );
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
