import 'package:cotton_valley_app/ui/auth/create_account/create_account_controller.dart';
import 'package:cotton_valley_app/ui/auth/select_your_plan/selectyour_planview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/image_constants.dart';
import '../../../widgets/auth_header_widget.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/mycustom_button.dart';
import '../widgets/auth_logo_widget.dart';

class CreateAccountview extends StatelessWidget {
  CreateAccountview({super.key});

  final CreateAccountController controller = Get.put(CreateAccountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 0.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ///// Logo
              AuthLogoWidget(
                height: 180.h,
                width: 200.w,
              ),
              //
              SizedBox(height: 40.h),
              ///// Header
              const Align(
                alignment: Alignment.centerLeft,
                child: AuthHeaderWidget(
                  title: 'Sign Up',
                  subtitle: 'Hi Welcome back, you have been missed',
                  //subtitle: 'Enter your credentials to continue.',
                ),
              ),
              SizedBox(height: 16.h),
              ///// Name Field
              CustomTextField(
                hintText: 'Name',
                titleText: 'Full Name',
                controller: controller.fullNameController,
              ),
              SizedBox(height: 10.h),
              ///// Email Field
              CustomTextField(
                hintText: 'Name',
                titleText: 'Company Name',
                controller: controller.companyNameController,
              ),
              SizedBox(height: 10.h),
              ///// Email Field
              CustomTextField(
                hintText: 'example@gmail.com',
                titleText: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(height: 10.h),

              ///// Password Field
              Obx(
                () => CustomTextField(
                  hintText: '********',
                  titleText: 'Create Password',
                  obscureText: controller.isCreatePassHidden.value,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Transform.scale(
                      scale: 0.6,
                      child: InkWell(
                        onTap: controller.toggleCreatePassword,
                        child: SvgPicture.asset(
                          controller.isCreatePassHidden.value
                              ? ImageConstants.eyeclosed
                              : ImageConstants.eyeopened,
                          width: 15.w,
                          height: 15.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  controller: controller.createPassController,
                ),
              ),

              SizedBox(height: 16.h),

              ///// Sign In Button
              MycustomButton(
                height: 39.h,
                width: 315.w,
                title: 'Sign Up',
                onPressed: () {
                  String? error = controller.fieldValidation();
                  if (error != null) {
                    CommonFunctions.showMessage(
                        title: "Error",
                        message: error,
                        color: AppColors.redColor);
                  } else {
                    CommonFunctions.showMessage(
                        title: "Success",
                        message: "",
                        color: AppColors.redColor);

                    Get.to(() => const SelectyourPlanview());
                  }
                },
              ),
              SizedBox(
                height: 10.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
