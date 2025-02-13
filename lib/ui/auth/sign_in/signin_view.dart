import 'package:cotton_valley_app/ui/auth/find_account/find_accountview.dart';
import 'package:cotton_valley_app/ui/auth/sign_in/signin_controller.dart';
import 'package:cotton_valley_app/ui/auth/create/create_passwordview.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/image_constants.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_textfield.dart';
import '../../../widgets/forgot_passtext.dart';
import '../../../widgets/mytext_widget.dart';
import '../../navigation/navigation_view.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    final SigninController controller = Get.put(SigninController());

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 60.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ///// Logo
              SvgPicture.asset(
                ImageConstants.authimg,
                width: 253.w,
                height: 203.h,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 50.h),

              ///// Title
              const Align(
                alignment: Alignment.centerLeft,
                child: MyTextWidget(
                  title: 'Sign In',
                  subtitle: 'Enter your credentials to continue.',
                ),
              ),
              SizedBox(height: 16.h),

              ///// Email Field
              CustomTextField(
                hintText: 'example@gmail.com',
                titleText: 'Email',
                controller: controller.emailController,
              ),
              SizedBox(height: 20.h),

              ///// Password Field
              Obx(
                () => CustomTextField(
                  hintText: '********',
                  titleText: 'Password',
                  obscureText: controller.isPassHidden.value,
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: Transform.scale(
                      scale: 0.7,
                      child: InkWell(
                        onTap: controller.togglePassword,
                        child: SvgPicture.asset(
                          controller.isPassHidden.value
                              ? ImageConstants.eyeclosed
                              : ImageConstants.eyeopened,
                          width: 15.w,
                          height: 15.h,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  controller: controller.passwordController,
                ),
              ),
              SizedBox(height: 4.h),

              ///// Forgot Password Section
              ForgotpassText(
                onTap: () => Get.to(() => const FindAccountview()),
              ),
              SizedBox(height: 16.h),

              ///// Sign In Button
              MycustomButton(
                height: 39.h,
                width: 315.w,
                title: 'Sign In',
                onPressed: () {
                  final error = controller.fieldValidation();
                  if (error != null) {
                    controller.showMessage('Error', error, AppColors.redColor);
                  } else {
                    controller.showMessage('Welcome', '', Color(0xFF002366));
                    Get.offAll(() => NavigationView());
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
