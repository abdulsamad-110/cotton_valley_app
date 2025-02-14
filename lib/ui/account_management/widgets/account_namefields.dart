import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/text_style.dart';
import '../../../widgets/custom_textfield.dart';
import '../account_management_controller.dart';

class AccountNameFields extends StatelessWidget {
  const AccountNameFields({super.key, required this.controller});

  final AccountManagementController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: CustomTextField(
              height: 33.h,
              width: 160.w,
              controller: controller.firstNameController,
              hintText: "John",
              hintTextStyle: AppTextStyles.popRegular10,
              titleText: "First Name",
            ),
          ),
          SizedBox(width: 5.w),
          Expanded(
            child: CustomTextField(
              height: 33.h,
              width: 160.w,
              controller: controller.lastNameController,
              hintText: "William",
              hintTextStyle: AppTextStyles.popRegular10,
              titleText: "Last Name",
            ),
          ),
        ],
      ),
    );
  }
}
