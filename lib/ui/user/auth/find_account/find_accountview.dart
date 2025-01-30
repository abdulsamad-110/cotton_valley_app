import 'package:cotton_valley_app/ui/user/auth/find_account/findaccount_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/otp/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/assets.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/forgot_passtext.dart';
import '../../../../widgets/mytext_widget.dart';

class FindAccountview extends StatelessWidget {
  const FindAccountview({super.key});

  @override
  Widget build(BuildContext context) {
    FindaccountController controller = Get.put(FindaccountController());
    return Scaffold(
      appBar: CustomAppBar(
        backImage: SvgPicture.asset(
          Assets.backarrow,
          width: 24.w,
          height: 24.h,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 0, left: 30, right: 30, bottom: 30),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///// Logo
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: SvgPicture.asset(
                        Assets.authimg,
                        width: 253.w,
                        height: 203.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 50.h),
                    //
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///// MyTextWidget
                        const MyTextWidget(
                          title: 'Find Your Account',
                          subtitle:
                              'Enter your email address to receive a verifiction code.',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          titleText: 'Email',
                          hintText: 'example@gmail.com',
                          controller: controller.emailController,
                        ),

                        SizedBox(height: 20.h),

                        ///// Forgot password text
                        ForgotpassText(
                          onTap: () {
                            print('Forgot password tapped!');
                            Get.to(() => const OtpView());
                          },
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Button
                        CustomButton(
                          backgroundColor: AppColors.redColor,
                          textColor: AppColors.whiteColor,
                          text: 'Find Account',
                          onPressed: () {
                            print('Sign In button pressed!');
                          },
                          width: double.infinity,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
