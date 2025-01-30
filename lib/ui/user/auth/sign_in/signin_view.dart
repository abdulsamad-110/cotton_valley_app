import 'package:cotton_valley_app/ui/user/auth/sign_in/signin_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/create/create_passwordview.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/forgot_passtext.dart';
import '../../../../widgets/mytext_widget.dart';
import '../../home/home_view.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    SigninController controller = Get.put(SigninController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///// Logo
                    Padding(
                      padding: const EdgeInsets.only(top: 60.0),
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
                          title: 'Sign In',
                          subtitle: 'Enter your credentials to continue.',
                        ),
                        SizedBox(height: 16.h),
                        CustomTextField(
                          titleText: 'Email',
                          hintText: 'example@gmail.com',
                          controller: controller.emailController,
                        ),

                        SizedBox(height: 20.h),
                        ///// Custom Password TextField
                        Obx(
                          () => CustomTextField(
                            titleText: 'Password',
                            hintText: '*******',
                            // hintTextStyle: AppTextStyles.popRegular10,
                            obscureText: controller.isPassHidden.value,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: SizedBox(
                                child: InkWell(
                                  onTap: () {
                                    controller.togglePassword();
                                    print("toggle work====>");
                                  },
                                  child: SvgPicture.asset(
                                    controller.isPassHidden.value
                                        ? Assets.eyeclose
                                        : Assets.eyeopen,
                                    width: 15.w,
                                    height: 15.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            controller: controller.passwordController,
                          ),
                        ),

                        SizedBox(height: 4.h),
                        ///// Forgot password text
                        ForgotpassText(
                          onTap: () {
                            print('Forgot password tapped!');
                            Get.to(() => const CreatePasswordView());
                          },
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Button
                        CustomButton(
                          backgroundColor: AppColors.redColor,
                          textColor: AppColors.whiteColor,
                          text: 'Sign In',
                          onPressed: () {
                            Get.offAll(() => const HomeView());
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
