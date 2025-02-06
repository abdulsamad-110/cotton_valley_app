import 'package:cotton_valley_app/ui/user/auth/otp/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../utils/assets.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/forgot_passtext.dart';
import '../../../../widgets/mycustom_button.dart';
import '../../../../widgets/mytext_widget.dart';
import 'findaccount_controller.dart';

class FindAccountview extends StatelessWidget {
  const FindAccountview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FindaccountController());

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Align(
        alignment: Alignment.topCenter, // Content ko upar shift karega
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: 30.w, vertical: 60.h), // Vertical padding reduce
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              SvgPicture.asset(
                Assets.authimg,
                width: 253.w,
                height: 203.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 30.h), // Kam kiya taaki aur upar ho

              // Title and Subtitle
              const MyTextWidget(
                title: 'Find Your Account',
                subtitle:
                    'Enter your email address to receive a verification code.',
              ),
              SizedBox(height: 12.h), // Kam kiya taaki aur upar ho

              // Email Field
              CustomTextField(
                hintText: 'example@gmail.com',
                titleText: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(height: 8.h),

              // Forgot password text
              ForgotpassText(
                onTap: () => Get.to(() => const OtpView()),
              ),
              SizedBox(height: 8.h),

              // Find Account Button
              MycustomButton(
                height: 39.h,
                width: 315.w,
                title: 'Find Account',
                onPressed: () {
                  print('Find Account button pressed!');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
