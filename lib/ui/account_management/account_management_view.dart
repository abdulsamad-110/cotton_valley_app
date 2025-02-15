import 'package:cotton_valley_app/ui/account_management/widgets/account_namefields.dart';
import 'package:cotton_valley_app/ui/account_management/widgets/account_passwordfields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/image_constants.dart';
import '../../utils/text_style.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/mycustom_button.dart';
import 'account_management_controller.dart';

class AccountManagementView extends StatelessWidget {
  AccountManagementView({super.key});
  final AccountManagementController controller =
      Get.put(AccountManagementController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Account Management'),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 200.h,
                          width: 315.w,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                        ),
                        Positioned(
                          right: 20.w,
                          bottom: 20.h,
                          child: SvgPicture.asset(
                            color: Colors.white,
                            ImageConstants.filtericon,
                            height: 30.h,
                            width: 30.w,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 16.h),
                    /////
                    AccountNameFields(controller: controller),
                    SizedBox(height: 8.h),
                    //
                    CustomTextField(
                      height: 33.h,
                      controller: controller.emailController,
                      hintText: "example@gmail.com",
                      hintTextStyle: AppTextStyles.popRegular10,
                      titleText: "Email",
                    ),
                    SizedBox(height: 8.h),
                    //
                    CustomTextField(
                      height: 33.h,
                      controller: controller.phoneController,
                      hintText: "+1 515 513XXXX",
                      hintTextStyle: AppTextStyles.popRegular10,
                      titleText: "Phone",
                    ),
                    SizedBox(height: 8.h),
                    /////
                    AccountPasswordFields(controller: controller),
                    //
                    SizedBox(height: 16.h),
                    //
                    MycustomButton(
                      height: 39.h,
                      width: 315.w,
                      title: "Update Account",
                      onPressed: () {},
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
