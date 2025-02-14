import 'package:cotton_valley_app/ui/auth/otp/otpview_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpInputRow extends StatelessWidget {
   OtpInputRow({super.key});
  final controller = Get.find<OtpviewController>();

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OtpInputBox(textController: controller.otpcontroller1),
        OtpInputBox(textController: controller.otpcontroller2),
        OtpInputBox(textController: controller.otpcontroller3),
        OtpInputBox(textController: controller.otpcontroller4),
        OtpInputBox(textController: controller.otpcontroller5),
        OtpInputBox(textController: controller.otpcontroller6),
      ],
    );
  }
}

class OtpInputBox extends StatelessWidget {
  final bool isNumberKeyboard;
  final TextEditingController? textController;

  const OtpInputBox({super.key, this.isNumberKeyboard = true, this.textController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 46.w,
      child: TextFormField(
        controller: textController,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: AppTextStyles.popRegular10,
        keyboardType: isNumberKeyboard ? TextInputType.number : TextInputType.text,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
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
