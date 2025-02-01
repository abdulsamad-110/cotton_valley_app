import 'package:cotton_valley_app/ui/user/auth/changepassword/changepassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/assets.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/mytext_widget.dart';

class ChangePasswordview extends StatelessWidget {
  const ChangePasswordview({super.key});

  @override
  Widget build(BuildContext context) {
    ChangepasswordController controller = Get.put(ChangepasswordController());

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
                          title: 'Change Password',
                          subtitle: 'Create a new password for your account.',
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Password TextField
                        Obx(
                          () => Center(
                            child: CustomTextField(
                              hintText: '********',
                              titleText: 'New Password',
                              obscureText: controller.isNewPassHidden.value,
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 12.w),
                                child: SizedBox(
                                  child: InkWell(
                                    onTap: () {
                                      controller.toggleNewPassword();
                                    },
                                    child: SvgPicture.asset(
                                      controller.isNewPassHidden.value
                                          ? Assets.eyeclosed
                                          : Assets.eyeopened,
                                      width: 12.w,
                                      height: 12.h,
                                    ),
                                  ),
                                ),
                              ),
                              controller: controller.newpasswordController,
                            ),
                          ),
                        ),

                        SizedBox(height: 20.h),
                        ///// Custom Password TextField
                        Obx(
                          () => CustomTextField(
                            titleText: 'Confrim New Password',
                            hintText: '********',
                            obscureText:
                                controller.isConfrimNewPassHidden.value,
                            suffixIcon: Padding(
                              padding: EdgeInsets.only(right: 12.w),
                              child: SizedBox(
                                child: InkWell(
                                  onTap: () {
                                    controller.toggleConfirmNewPassword();
                                  },
                                  child: SvgPicture.asset(
                                    controller.isConfrimNewPassHidden.value
                                        ? Assets.eyeclosed
                                        : Assets.eyeopened,
                                    width: 12.w,
                                    height: 12.h,
                                  ),
                                ),
                              ),
                            ),
                            controller: controller.confirmnewpassController,
                          ),
                        ),

                        SizedBox(height: 16.h),
                        ///// Custom Button
                        CustomButton(
                          backgroundColor: AppColors.redColor,
                          textColor: AppColors.whiteColor,
                          text: 'Change Password',
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
