import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/image_constants.dart';

class CircularButton extends StatelessWidget {
  final VoidCallback? onTap; 

  const CircularButton({super.key, this.onTap}); 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, 
      child: Container(
        height: 48.h,
        width: 48.w,
        decoration: const BoxDecoration(
          color: AppColors.redColor,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: SvgPicture.asset(
            ImageConstants.addicon,
            width: 32.w,
            height: 32.h,
            fit: BoxFit.contain,
            colorFilter: const ColorFilter.mode(
                AppColors.whiteColor, BlendMode.srcIn), 
          ),
        ),
      ),
    );
  }
}
