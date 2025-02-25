import 'package:cotton_valley_app/ui/auth/otp/otpview_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpInputRow extends StatelessWidget {
  final OtpviewController controller;

  const OtpInputRow(
      {super.key, required this.controller}); 

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OtpInputBox(
            textController: controller.otpcontroller1,
            currentFocus: controller.focus1,
            toFocus: controller.focus2),
        OtpInputBox(
            textController: controller.otpcontroller2,
            currentFocus: controller.focus2,
            toFocus: controller.focus3,
            fromFocus: controller.focus1),
        OtpInputBox(
            textController: controller.otpcontroller3,
            currentFocus: controller.focus3,
            fromFocus: controller.focus2,
            toFocus: controller.focus4),
        OtpInputBox(
            textController: controller.otpcontroller4,
            currentFocus: controller.focus4,
            fromFocus: controller.focus3,
            toFocus: controller.focus5),
        OtpInputBox(
            textController: controller.otpcontroller5,
            currentFocus: controller.focus5,
            fromFocus: controller.focus4,
            toFocus: controller.focus6),
        OtpInputBox(
            textController: controller.otpcontroller6,
            currentFocus: controller.focus6,
            fromFocus: controller.focus5),
      ],
    );
  }
}

class OtpInputBox extends StatelessWidget {
  final TextEditingController? textController;
  final FocusNode? fromFocus;
  final FocusNode? toFocus;
  final FocusNode? currentFocus;

  const OtpInputBox(
      {super.key,
      this.textController,
      this.fromFocus,
      this.toFocus,
      this.currentFocus});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 46.w,
      child: TextField(
        focusNode: currentFocus,
        controller: textController,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).requestFocus(toFocus);
          } else if (value.length < 1) {
            FocusScope.of(context).requestFocus(fromFocus);
          }
        },
        textAlign: TextAlign.center,
        style: AppTextStyles.popRegular10,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          
        ],
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.lightgreyColor,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.lightgreyColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(color: AppColors.lightgreyColor),
          ),
        ),
      ),
    );
  }
}
