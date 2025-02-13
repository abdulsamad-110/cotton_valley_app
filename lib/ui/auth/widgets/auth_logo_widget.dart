import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/image_constants.dart';

class AuthLogoWidget extends StatelessWidget {
  final double width;
  final double height;

  const AuthLogoWidget({super.key, this.width = 253, this.height = 203});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      ImageConstants.authimg,
      width: width.w,
      height: height.h,
      fit: BoxFit.contain,
    );
  }
}
