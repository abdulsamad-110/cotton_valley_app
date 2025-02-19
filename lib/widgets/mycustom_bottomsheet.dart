import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomSheet extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget myWidget;
  final EdgeInsetsGeometry? padding;
  const CustomBottomSheet({
    super.key,
    required this.myWidget,
    this.width,
    this.height,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.r),
            topLeft: Radius.circular(30.r),
            //  bottomRight: Radius.circular(10.r),
            //  bottomLeft: Radius.circular(10.r),
          ),
          color: AppColors.whiteColor,
        ),
        child: Padding(
            padding:
                padding ?? EdgeInsets.only(left: 38.w, right: 38.w, top: 16.h),
            child: Column(
              children: [
                Container(
                  height: 3.h,
                  width: 68.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.blackColor,
                  ),
                ),
                // SizedBox(
                //   height: 44.h,
                // ),
                myWidget,
              ],
            )),
      ),
    );
  }
}
