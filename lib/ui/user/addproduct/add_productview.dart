import 'package:cotton_valley_app/ui/user/addvendor/addvendor_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/custom_button.dart';
import 'package:cotton_valley_app/widgets/custom_textfield.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:cotton_valley_app/widgets/product_custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/uploadcontainer.dart';
import 'addproduct_controller.dart';

class AddProductView extends StatelessWidget {
  final AddProductController controller = Get.put(AddProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          /// Custom App Bar
          CustomAppBar(
            cancelIcon: SvgPicture.asset(
              height: 20.h,
              width: 20.w,
              Assets.cancelicon,
            ),
            title: 'Add Product',
          ),

          const Divider(),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  /// Vendor/Store Field
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.vdrstoreController,
                    hintText: "Adidas",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Vendor/Store",
                    suffixIcon: SvgPicture.asset(
                      height: 15.h,
                      width: 15.w,
                      Assets.addicon,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  /// Name Field
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.nameController,
                    hintText: "Air-2",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Name",
                  ),

                  /// Media Box
                  SizedBox(height: 8.h),

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: UploadContainer(
                      label: "Media",
                      content: "Upload File\n or\nTake a Photo",
                    ),
                  ),

                  /// Price Field
                  SizedBox(height: 8.h),
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.priceController,
                    hintText: "24.33",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Price",
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  /// Category Field
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.categoryController,
                    hintText: "Select",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Category",
                    suffixIcon: SvgPicture.asset(
                      height: 15.h,
                      width: 15.w,
                      Assets.addicon,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  /// Sub-Category Field
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.subcategoryController,
                    hintText: "Select",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Sub-Category",
                    suffixIcon: SvgPicture.asset(
                      height: 15.h,
                      width: 15.w,
                      Assets.addicon,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),

                  /// Keyword Field
                  CustomTextField(
                    height: 33.h,
                    width: 330.w,
                    controller: controller.keywordController,
                    hintText: "Keyword",
                    hintTextStyle: AppTextStyles.popRegular10,
                    titleText: "Keyword",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      /////
                      ProductCustomButton(
                          height: 28.h,
                          width: 50.w,
                          title: 'tag',
                          leadingIcon: SvgPicture.asset(
                            colorFilter: const ColorFilter.mode(
                                AppColors.whiteColor, BlendMode.srcIn),
                            Assets.addicon,
                            height: 15.h,
                            width: 15.w,
                          ),
                          onTap: () {}),
                      SizedBox(
                        width: 4.w,
                      ),
                      /////
                      ProductCustomButton(
                          height: 28.h,
                          width: 50.w,
                          title: 'tag',
                          leadingIcon: SvgPicture.asset(
                            colorFilter: const ColorFilter.mode(
                                AppColors.whiteColor, BlendMode.srcIn),
                            Assets.addicon,
                            height: 15.h,
                            width: 15.w,
                          ),
                          // iconColor: AppColors.whiteColor,
                          onTap: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.h),

          /// Add Product Button
          MycustomButton(
            height: 44.h,
            width: 330.w,
            title: "Add Product",
            onPressed: () {},
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
