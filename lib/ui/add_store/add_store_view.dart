import 'package:cotton_valley_app/ui/add_vendor/add_vendor_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/image_constants.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/custom_button.dart';
import 'package:cotton_valley_app/widgets/custom_dropdown.dart';
import 'package:cotton_valley_app/widgets/custom_textfield.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../utils/text_style.dart';
import 'add_store_controller.dart';

class AddStoreView extends StatelessWidget {
  final AddStoreController controller = Get.put(AddStoreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///// Custom App Bar
          CustomAppBar(
            cancelIcon: SvgPicture.asset(
              height: 20.h,
              width: 20.w,
              ImageConstants.cancelicon,
            ),
            title: 'Add Storer',
          ),
          /////
          const Divider(),
          //
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //
                  CustomTextField(
                    controller: controller.homeController,
                    hintText: "John",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Name",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    controller: controller.codeController,
                    hintText: "121651",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Code",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomDropdown(
                    height: 39.h,
                    width: 315.w,
                    titleText: 'Country',
                    hintText: 'United Kingdom',
                    controller: controller.countryController,
                    showBorder: false,
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomDropdown(
                    height: 39.h,
                    width: 315.w,
                    titleText: 'City',
                    hintText: 'London',
                    controller: controller.cityController,
                    showBorder: false,
                    onTap: () {},
                  ),

                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    controller: controller.phoneController,
                    hintText: "+1 515 513XXXX",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Phone",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    controller: controller.emailController,
                    hintText: "example@gmail.com",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Email",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    controller: controller.wechatController,
                    hintText: "wechat.com/u/example",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "WeChat",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    controller: controller.webController,
                    hintText: "www.example.com",
                    // contentPadding: EdgeInsets.symmetric(
                    //     horizontal: 13.0.w, vertical: context.height * 0.05),
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Web",
                  ),
                ],
              ),
            ),
          ),
          //
          SizedBox(height: 20.h),
          /////
          MycustomButton(
            height: 39.h,
            width: 315.w,
            title: "Add Store",
            onPressed: () {},
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
