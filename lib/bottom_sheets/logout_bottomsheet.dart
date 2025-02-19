import 'package:cotton_valley_app/ui/setting/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../services/storage_services/local_storage_services.dart';
import '../ui/auth/sign_in/signin_view.dart';
import '../utils/app_colors.dart';
import '../utils/common_functions.dart';
import '../utils/text_style.dart';

import '../widgets/custom_bottomsheet.dart';
import '../widgets/mycustom_bottomsheet.dart';
import '../widgets/mycustom_button.dart';

class LogoutBottomSheet extends StatelessWidget {
  // final bool isGuest;
  final SettingController controller;
  const LogoutBottomSheet(BuildContext context,
      {super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return CustomBottomSheet(
      height: 180.h,
      myWidget: Expanded(
        child: Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: SizedBox(
            width: context.width * 0.82,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Title(
                  color: AppColors.blackColor,
                  child: Text(
                    'Logout',
                    style: AppTextStyles.popBold14,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                const Text(
                  'Are you sure you want to log out?',
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child:
                          //// Logout Button
                          MycustomButton(
                        backgroundColor: AppColors.whiteColor,
                        borderRadius: 6.r,
                        hasBorder: true,
                        borderColor: AppColors.blackColor,
                        title: 'Cancel',
                        titleTextStyle: const TextStyle(
                          color: AppColors.blackColor,
                        ),
                        width: 163.w,
                        height: 31.h,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(
                      width: 6.w,
                    ),
                    Expanded(
                      child:
                          //// Logout Button
                          MycustomButton(
                        backgroundColor: AppColors.redColor,
                        borderRadius: 6.r,
                        title: 'Logout',
                        titleTextStyle: const TextStyle(
                          color: AppColors.whiteColor,
                        ),
                        width: 163.w,
                        height: 31.h,
                        onPressed: () {
                          Navigator.pop(context);
                          Future.delayed(const Duration(milliseconds: 300), () {
                            Get.offAll(() => const SigninView());
                          });
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
