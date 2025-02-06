import 'package:cotton_valley_app/ui/user/addvendor/addvendor_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/custom_button.dart';
import 'package:cotton_valley_app/widgets/custom_textfield.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/text_style.dart';
import 'addstore.controller.dart';

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
              Assets.cancelicon,
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
                    height: 33.h,
                    width: 330.w,
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
                    height: 33.h,
                    width: 330.w,
                    controller: controller.codeController,
                    hintText: "121651",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Code",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.countryController,
                    hintText: "United Kingdom",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Country",
                    suffixIcon: SvgPicture.asset(
                        height: 15.h, width: 15.w, Assets.addicon),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.cityController,
                    hintText: "London",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "City",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  //
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
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
                    height: 33.h,
                    width: 330.w,
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
                    height: 33.h,
                    width: 330.w,
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
                    // height: 33.h,
                    // width: 330.w,
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
