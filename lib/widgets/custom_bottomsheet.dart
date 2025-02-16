import 'package:cotton_valley_app/ui/auth/sign_in/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';
import 'mycustom_button.dart';

void LogoutBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        height: 170.h,
        width: 375.w,
        decoration: const BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Logout',
                style: AppTextStyles.popRegular14,
              ),
              const SizedBox(height: 8),
              Text(
                'Are you sure you want to logout?',
                textAlign: TextAlign.center,
                style: AppTextStyles.popRegular10,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MycustomButton(
                    height: 31.h,
                    width: 163.w,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.blackColor,
                    hasBorder: true,
                    borderRadius: 6.r,
                    title: 'Cancel',
                    titleTextStyle: const TextStyle(
                      color: AppColors.blackColor,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 4.w),
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
                        
                        Get.offAll(() => SigninView());
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
