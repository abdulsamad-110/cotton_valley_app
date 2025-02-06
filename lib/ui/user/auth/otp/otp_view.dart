import 'package:cotton_valley_app/ui/user/auth/changepassword/change_passwordview.dart';
import 'package:cotton_valley_app/ui/user/auth/otp/otpview_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/assets.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/mycustom_button.dart';
import '../../../../widgets/mytext_widget.dart';
import 'widgets/otpcustom_field.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final OtpviewController controller;
    Get.put(OtpviewController());
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: Column(
          children: [
            // Logo
            SvgPicture.asset(
              Assets.authimg,
              width: 253.w,
              height: 203.h,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 50.h),

            // Title and Subtitle
            const MyTextWidget(
              title: 'OTP',
              subtitle: 'Please enter the code sent to your email address.',
            ),
            SizedBox(height: 16.h),

            // OTP Field
            const OtpCustomField(),
            SizedBox(height: 16.h),

            // Verify Button
            MycustomButton(
              height: 39.h,
              width: 315.w,
              title: 'Verify',
              onPressed: () {
                // Navigate to ChangePasswordView
                Get.to(() => const ChangePasswordview());
                print('Verify button pressed!');
              },
            ),
          ],
        ),
      ),
    );
  }
}
