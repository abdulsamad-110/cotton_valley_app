import 'package:cotton_valley_app/ui/user/auth/changepassword/change_passwordview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/assets.dart';
import '../../../../widgets/custom_appbar.dart';
import '../../../../widgets/custom_button.dart';
import '../../../../widgets/forgot_passtext.dart';
import '../../../../widgets/mycustom_button.dart';
import '../../../../widgets/mytext_widget.dart';
import 'widgets/otpcustom_field.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          // backImage: SvgPicture.asset(
          //   Assets.backarrow,
          //   width: 24.w,
          //   height: 24.h,
          // ),
          ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 30, right: 30, bottom: 30),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///// Logo
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
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
                          title: 'OTP',
                          subtitle:
                              'Please enter the code sent to your email address.',
                        ),
                        //
                        SizedBox(height: 16.h),
                        ///// OTP Customfield Widget
                        const OtpCustomField(),
                        //
                        SizedBox(height: 16.h),
                        ///// Custom Button
                        MycustomButton(
                            height: 44.h,
                            width: 330.w,
                            title: 'Verify',
                            onPressed: () {
                              //await controller.logIn();
                              Get.to(() => ChangePasswordview());
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
