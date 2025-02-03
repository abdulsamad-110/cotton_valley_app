import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('Circular Button Pressed');
      },
      child: Container(
        height: 48.h, 
        width: 48.w,
        decoration:  BoxDecoration(
          color: AppColors.redColor, 
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            Assets.addicon, 
            width: 32.w, 
            height: 32.h,
            fit: BoxFit.contain,
            colorFilter:  ColorFilter.mode(AppColors.whiteColor, BlendMode.srcIn), // White icon color
          ),
        ),
      ),
    );
  }
}
