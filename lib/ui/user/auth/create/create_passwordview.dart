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
import '../../../../utils/text_style.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/mycustom_button.dart';

class CreatePasswordView extends StatelessWidget {
  const CreatePasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    CreatePasswordviewController controller =
        Get.put(CreatePasswordviewController());

    return Scaffold(
      appBar: CustomAppBar(
          // backImage: SvgPicture.asset(
          //   Assets.backarrow,
          //   width: 20.w,
          //   height: 20.h,
          // ),
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

                        Obx(
                          () => CustomTextField(
                            height: 31.h,
                            width: 315.w,
                            titleText: "Password",
                            hintText: '********',
                            isBorder: false,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.0.w,
                                vertical: context.height * 0.0),
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
                                  width: 15.0.w,
                                  height: 15.0.h,
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

                        SizedBox(height: 20.h),
                        ///// Custom Password TextField
                        Obx(
                          () => CustomTextField(
                            height: 31.h,
                            width: 315.w,
                            titleText: "Confrim Password",
                            hintText: '********',
                            isBorder: false,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.0.w,
                                vertical: context.height * 0.0),
                            controller: controller.confrimPassController,
                            hintTextStyle: AppTextStyles.popRegular10,
                            obscureText: controller.isConfrimPassHidden.value,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.toggleConfrimPassword();
                              },
                              child: Padding(
                                padding: controller.isConfrimPassHidden.value
                                    ? EdgeInsets.symmetric(
                                        horizontal: 12.0.w, vertical: 13.h)
                                    : EdgeInsets.all(11.r),
                                child: SizedBox(
                                  width: 15.0.w,
                                  height: 15.0.h,
                                  child: SvgPicture.asset(
                                    controller.isConfrimPassHidden.value
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
                            Get.to(() => const FindAccountview());
                          },
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Button
                        MycustomButton(
                            height: 44.h,
                            width: 330.w,
                            title: 'Create Password',
                            onPressed: () {
                              //await controller.logIn();
                              //Get.offAll(() => NavigationView());
                              print('Sign In button pressed!');
                            }),
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
