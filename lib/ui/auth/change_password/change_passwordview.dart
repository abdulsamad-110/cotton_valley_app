import 'package:cotton_valley_app/ui/auth/change_password/changepassword_controller.dart';
import 'package:cotton_valley_app/ui/auth/sign_in/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/image_constants.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/mycustom_button.dart';
import '../../../widgets/mytext_widget.dart';

class ChangePasswordview extends StatelessWidget {
  const ChangePasswordview({super.key});

  @override
  Widget build(BuildContext context) {
    ChangepasswordController controller = Get.put(ChangepasswordController());

    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            ///// Logo
            SvgPicture.asset(
              ImageConstants.authimg,
              width: 253.w,
              height: 203.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 50.h),

            /////
            const MyTextWidget(
              title: 'Change Password',
              subtitle: 'Create a new password for your account.',
            ),
            SizedBox(height: 16.h),

            ///// New Password Field
            Obx(
              () => CustomTextField(
                hintText: '********',
                titleText: 'New Password',
                obscureText: controller.isNewPassHidden.value,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Transform.scale(
                    scale: 0.6,
                    child: InkWell(
                      onTap: () {
                        controller.toggleNewPassword();
                      },
                      child: SvgPicture.asset(
                        controller.isNewPassHidden.value
                            ? ImageConstants.eyeclosed
                            : ImageConstants.eyeopened,
                        width: 15.w,
                        height: 15.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                controller: controller.newpasswordController,
              ),
            ),

            SizedBox(height: 20.h),

            ///// Confirm New Password Field
            Obx(
              () => CustomTextField(
                titleText: 'Confirm New Password',
                hintText: '********',
                obscureText: controller.isConfrimNewPassHidden.value,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Transform.scale(
                    scale: 0.6, // Reduce the size further
                    child: InkWell(
                      onTap: () {
                        controller.toggleConfrimNewPassword();
                      },
                      child: SvgPicture.asset(
                        controller.isConfrimNewPassHidden.value
                            ? ImageConstants.eyeclosed
                            : ImageConstants.eyeopened,
                        width:
                            15.w, // Even if this is fixed, scale will reduce it
                        height: 15.h,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                controller: controller.confrimnewpassController,
              ),
            ),

            SizedBox(height: 16.h),

            ///// Change Password Button
            MycustomButton(
              height: 39.h,
              width: 315.w,
              title: 'Change Password',
              onPressed: () {
                Get.to(() => const SigninView());
                print('Change Password button pressed!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
