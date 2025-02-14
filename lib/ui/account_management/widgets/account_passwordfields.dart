import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../utils/image_constants.dart';
import '../../../widgets/custom_textfield.dart';
import '../account_management_controller.dart';

class AccountPasswordFields extends StatelessWidget {
  const AccountPasswordFields({super.key, required this.controller});

  final AccountManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => CustomTextField(
            height: 33.h,
            hintText: '********',
            titleText: 'Current Password',
            obscureText: controller.isCurrentPassHidden.value,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Transform.scale(
                scale: 0.6,
                child: InkWell(
                  onTap: controller.toggleCurrentPassword,
                  child: SvgPicture.asset(
                    controller.isCurrentPassHidden.value
                        ? ImageConstants.eyeclosed
                        : ImageConstants.eyeopened,
                    width: 15.w,
                    height: 15.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            controller: controller.currentPassController,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => CustomTextField(
            height: 33.h,
            hintText: '********',
            titleText: 'New Password',
            obscureText: controller.isNewPassHidden.value,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Transform.scale(
                scale: 0.6,
                child: InkWell(
                  onTap: controller.toggleNewPassword,
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
            controller: controller.newPassController,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => CustomTextField(
            height: 33.h,
            hintText: '********',
            titleText: 'Confirm New Password',
            obscureText: controller.isConfirmNewPassHidden.value,
            suffixIcon: Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: Transform.scale(
                scale: 0.6,
                child: InkWell(
                  onTap: controller.toggleConfirmNewPassword,
                  child: SvgPicture.asset(
                    controller.isConfirmNewPassHidden.value
                        ? ImageConstants.eyeclosed
                        : ImageConstants.eyeopened,
                    width: 15.w,
                    height: 15.h,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            controller: controller.confirmNewPassController,
          ),
        ),
      ],
    );
  }
}
