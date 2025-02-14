import 'package:cotton_valley_app/ui/auth/sign_in/signin_controller.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordWidget extends StatelessWidget {
  final VoidCallback onTap;
   final controller = Get.find<SigninController>();

   ForgotPasswordWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: Text(
            'forgot password?',
            style: AppTextStyles.popRegular10,
          ),
        ),
      ],
    );
  }
}
