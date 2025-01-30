import 'package:cotton_valley_app/ui/user/auth/sign_in/signin_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/changepassword/change_passwordview.dart';
import 'package:cotton_valley_app/ui/user/auth/create/create_passwordview_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/find_account/find_accountview.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../../widgets/forgot_passtext.dart';
import '../../../../../widgets/mytext_widget.dart';
import '../../../../widgets/custom_textfield.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    CreatePasswordviewController controller =
        Get.put(CreatePasswordviewController());

    return Scaffold(
      appBar: CustomAppBar(
        backImage: SvgPicture.asset(
          Assets.backarrow,
          width: 20.w,
          height: 20.h,
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
                      padding: const EdgeInsets.only(top: 16),
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
                          title: 'Create Password',
                          subtitle:
                              'You’re signing in for the first time. Create your password now.',
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Password TextField
                        Obx(
                          () => Center(
                            child: CustomTextField(
                              hintText: '********',
                              titleText: 'Password',
                              obscureText: controller.isPassHidden.value,
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: SizedBox(
                                  child: InkWell(
                                    onTap: () {
                                      controller.togglePassword();
                                    },
                                    child: SvgPicture.asset(
                                      controller.isPassHidden.value
                                          ? Assets.eyeclose
                                          : Assets.eyeopen,
                                      width: 12.w,
                                      height: 12.h,
                                    ),
                                  ),
                                ),
                              ),
                              controller: controller.passwordController,
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),
                        ///// Custom Password TextField
                        Obx(
                          () => CustomTextField(
                            titleText: 'Confrim Password',
                            hintText: '********',
                            obscureText: controller.isConfrimPassHidden.value,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: SizedBox(
                                child: InkWell(
                                  onTap: () {
                                    controller.toggleConfrimPassword();
                                  },
                                  child: SvgPicture.asset(
                                    controller.isConfrimPassHidden.value
                                        ? Assets.eyeclose
                                        : Assets.eyeopen,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ),
                              ),
                            ),
                            controller: controller.confrimPassController,
                          ),
                        ),

                        SizedBox(height: 4.h),
                        ///// Forgot password text
                        ForgotpassText(
                          onTap: () {
                            print('Forgot password tapped!');
                            Get.to(() => const FindAccountview());
                          },
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Button
                        CustomButton(
                          backgroundColor: AppColors.redColor,
                          textColor: AppColors.whiteColor,
                          text: 'Sign In',
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
