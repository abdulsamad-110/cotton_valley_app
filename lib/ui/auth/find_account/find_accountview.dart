import 'package:cotton_valley_app/ui/auth/otp/otp_view.dart';
import 'package:cotton_valley_app/ui/auth/widgets/auth_logo_widget.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/image_constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/forgot_pass_widget.dart';
import '../../../widgets/mycustom_button.dart';
import '../../../widgets/auth_header_widget.dart';
import 'findaccount_controller.dart';

class FindAccountview extends StatelessWidget {
  const FindAccountview({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FindaccountController());

    return Scaffold(
      appBar: CustomAppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// Logo
              const AuthLogoWidget(),
              //
              SizedBox(height: 50.h),

              ///// Header
              const AuthHeaderWidget(
                title: 'Find Your Account',
                subtitle:
                    'Enter your email address to receive a verification code.',
              ),
              SizedBox(height: 21.h),

              ///// Email Field
              CustomTextField(
                hintText: 'example@gmail.com',
                titleText: 'Email',
                controller: controller.emailController,
              ),

              SizedBox(height: 16.h),

              ///// Find Account Button
              MycustomButton(
                height: 39.h,
                width: 315.w,
                title: 'Find Account',
                onPressed: () {
                  final error = controller.fieldValidation();
                  if (error != null) {
                    controller.showMessage("Error", error, AppColors.redColor);
                    return;
                  }
                  controller.clearTextFields();
                  Get.to(() => const OtpView());
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
