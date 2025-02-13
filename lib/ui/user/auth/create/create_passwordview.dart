import 'package:cotton_valley_app/ui/user/auth/sign_in/signin_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/change_password/change_passwordview.dart';
import 'package:cotton_valley_app/ui/user/auth/create/create_passwordview_controller.dart';
import 'package:cotton_valley_app/ui/user/auth/find_account/find_accountview.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/image_constants.dart';
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
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///// Logo
                    SvgPicture.asset(
                      ImageConstants.authimg,
                      width: 253.w,
                      height: 203.h,
                      fit: BoxFit.contain,
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
                        // Password Field
                        Obx(
                          () => CustomTextField(
                            hintText: '********',
                            titleText: 'Password',
                            obscureText: controller.isPassHidden.value,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: Transform.scale(
                                scale: 0.7, // Reduce the size further
                                child: InkWell(
                                  onTap: () {
                                    controller.togglePassword();
                                  },
                                  child: SvgPicture.asset(
                                    controller.isPassHidden.value
                                        ? ImageConstants.eyeclosed
                                        : ImageConstants.eyeopened,
                                    width: 15
                                        .w, // Even if this is fixed, scale will reduce it
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

                        SizedBox(height: 20.h),
                        ///// Custom Password TextField
                        // Password Field
                        Obx(
                          () => CustomTextField(
                            //width: 315.w,
                            hintText: '********',
                            titleText: 'Confrim Password',
                            obscureText: controller.isConfrimPassHidden.value,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: Transform.scale(
                                scale: 0.7, // Reduce the size further
                                child: InkWell(
                                  onTap: () {
                                    controller.toggleConfrimPassword();
                                  },
                                  child: SvgPicture.asset(
                                    controller.isConfrimPassHidden.value
                                        ? ImageConstants.eyeclosed
                                        : ImageConstants.eyeopened,
                                    width: 15
                                        .w, // Even if this is fixed, scale will reduce it
                                    height: 15.h,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            controller: controller.confrimPassController,
                          ),
                        ),
                        SizedBox(height: 4.h),

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
                            height: 39.h,
                            width: 315.w,
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
