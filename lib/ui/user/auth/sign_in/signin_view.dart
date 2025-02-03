import 'package:cotton_valley_app/ui/user/auth/sign_in/signin_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/create/create_passwordview.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/custom_button.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/forgot_passtext.dart';
import '../../../../widgets/mytext_widget.dart';
import '../../home/home_view.dart';
import '../../navigation/navigation_view.dart';

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
                        ///// Custom Email TextField
                        CustomTextField(
                          height: 31.h,
                          width: 315.w,
                          titleText: 'Email',
                          hintText: 'example@gmail.com',
                          isBorder: false,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 13.0.w,
                              vertical: context.height * 0.0),
                          controller: controller.emailController,
                          hintTextStyle: AppTextStyles.popRegular10,
                        ),

                        SizedBox(height: 20.h),
                        ///// Custom Password TextField
                        Obx(
                          () => CustomTextField(
                            height: 32.h,
                            width: 316.w,
                            titleText: "Password",
                            hintText: '********',
                            isBorder: false,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.0.w,
                                vertical: context.height * 0.02),
                            controller: controller.passwordController,
                            hintTextStyle: AppTextStyles.popRegular10,
                            obscureText: controller.isPassHidden.value,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.togglePassword();
                              },
                              child: Padding(
                                padding: controller.isPassHidden.value
                                    ? EdgeInsets.symmetric(
                                        horizontal: 12.0.w, vertical: 13.h)
                                    : EdgeInsets.all(11.r),
                                child: SizedBox(
                                  width: 24.0.w,
                                  height: 24.0.h,
                                  child: SvgPicture.asset(
                                    controller.isPassHidden.value
                                        ? Assets.eyeclosed
                                        : Assets.eyeopened,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
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
                        MycustomButton(
                            height: 37.h,
                            width: 316.w,
                            title: 'Sign In',
                            onPressed: () {
                              //await controller.logIn();
                              Get.offAll(() => NavigationView());
                              print('Sign In button pressed!');
                            }),
                        // CustomButton(
                        //   backgroundColor: AppColors.redColor,
                        //   textColor: AppColors.whiteColor,
                        //   text: 'Sign In',
                        //   onPressed: () {
                        //     Get.offAll(() => NavigationView());
                        //     print('Sign In button pressed!');
                        //   },
                        //   // width: double.infinity,
                        // ),
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
