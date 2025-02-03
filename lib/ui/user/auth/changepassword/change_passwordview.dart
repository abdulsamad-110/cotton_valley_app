import 'package:cotton_valley_app/ui/user/auth/changepassword/changepassword_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/assets.dart';
import '../../../../utils/text_style.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/custom_textfield.dart';
import '../../../../widgets/mycustom_button.dart';
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
                        // Obx(
                        //   () => Center(
                        //     child: CustomTextField(
                        //       hintText: '********',
                        //       titleText: 'New Password',
                        //       obscureText: controller.isNewPassHidden.value,
                        //       suffixIcon: Padding(
                        //         padding: EdgeInsets.only(right: 12.w),
                        //         child: SizedBox(
                        //           child: InkWell(
                        //             onTap: () {
                        //               controller.toggleNewPassword();
                        //             },
                        //             child: SvgPicture.asset(
                        //               controller.isNewPassHidden.value
                        //                   ? Assets.eyeclosed
                        //                   : Assets.eyeopened,
                        //               width: 12.w,
                        //               height: 12.h,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //       controller: controller.newpasswordController,
                        //     ),
                        //   ),
                        // ),
                        ///// Custom TextField
                        Obx(
                          () => CustomTextField(
                            height: 32.h,
                            width: 316.w,
                            titleText: "New Password",
                            hintText: '********',
                            isBorder: false,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.0.w,
                                vertical: context.height * 0.02),
                            controller: controller.newpasswordController,
                            hintTextStyle: AppTextStyles.popRegular10,
                            obscureText: controller.isNewPassHidden.value,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.toggleNewPassword();
                              },
                              child: Padding(
                                padding: controller.isNewPassHidden.value
                                    ? EdgeInsets.symmetric(
                                        horizontal: 12.0.w, vertical: 13.h)
                                    : EdgeInsets.all(11.r),
                                child: SizedBox(
                                  width: 24.0.w,
                                  height: 24.0.h,
                                  child: SvgPicture.asset(
                                    controller.isNewPassHidden.value
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
                        ///// Custom TextField
                        // Obx(
                        //   () => CustomTextField(
                        //     titleText: 'Confrim New Password',
                        //     hintText: '********',
                        //     obscureText:
                        //         controller.isConfrimNewPassHidden.value,
                        //     suffixIcon: Padding(
                        //       padding: EdgeInsets.only(right: 12.w),
                        //       child: SizedBox(
                        //         child: InkWell(
                        //           onTap: () {
                        //             controller.toggleConfirmNewPassword();
                        //           },
                        //           child: SvgPicture.asset(
                        //             controller.isConfrimNewPassHidden.value
                        //                 ? Assets.eyeclosed
                        //                 : Assets.eyeopened,
                        //             width: 12.w,
                        //             height: 12.h,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     controller: controller.confirmnewpassController,
                        //   ),
                        // ),
                        ///// Custom TextField
                        Obx(
                          () => CustomTextField(
                            height: 32.h,
                            width: 316.w,
                            titleText: "Confrim New Password",
                            hintText: '********',
                            isBorder: false,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 13.0.w,
                                vertical: context.height * 0.02),
                            controller: controller.confirmnewpassController,
                            hintTextStyle: AppTextStyles.popRegular10,
                            obscureText:
                                controller.isConfrimNewPassHidden.value,
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.toggleConfirmNewPassword();
                              },
                              child: Padding(
                                padding: controller.isConfrimNewPassHidden.value
                                    ? EdgeInsets.symmetric(
                                        horizontal: 12.0.w, vertical: 13.h)
                                    : EdgeInsets.all(11.r),
                                child: SizedBox(
                                  width: 24.0.w,
                                  height: 24.0.h,
                                  child: SvgPicture.asset(
                                    controller.isConfrimNewPassHidden.value
                                        ? Assets.eyeclosed
                                        : Assets.eyeopened,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        ///// Custom Button
                        MycustomButton(
                            height: 37.h,
                            width: 316.w,
                            title: 'Change Password',
                            onPressed: () {
                              //await controller.logIn();
                              //Get.to(() => ChangePasswordview());
                              print('button pressed!');
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
