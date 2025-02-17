import 'package:cotton_valley_app/ui/auth/change_password/change_passwordview.dart';
import 'package:cotton_valley_app/ui/auth/otp/otpview_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/mycustom_button.dart';
import '../../../widgets/auth_header_widget.dart';
import '../widgets/auth_logo_widget.dart';
import 'widgets/otp_input_row.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    OtpviewController controller = Get.put(OtpviewController());
    Get.put(OtpviewController());
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///// Logo
              const AuthLogoWidget(),
              SizedBox(height: 50.h),

              ///// Header
              const AuthHeaderWidget(
                title: 'OTP',
                subtitle: 'Please enter the code sent to your email address.',
              ),
              SizedBox(height: 20.h),

              ///// OTP Input Row (Now Below Header)
              OtpInputRow(),
              SizedBox(height: 20.h),

              ///// Verify Button
              MycustomButton(
                height: 39.h,
                width: 315.w,
                title: 'Verify',
                onPressed: () {
                  String? error = controller.validateOtp();
                  if (error != null) {
                    CommonFunctions.showMessage('Error', error, AppColors.redColor);
                   // controller.showMessage("Error", '', AppColors.redColor);
                  } else {
                    Get.offAll(() => ChangePasswordview());
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
