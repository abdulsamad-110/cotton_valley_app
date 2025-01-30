import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/text_style.dart'; 

class MyTextWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const MyTextWidget({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.popSemiBold24, 
        ),
        SizedBox(height: 4.h),
        Text(
          subtitle,
          style: AppTextStyles.popLight16, 
        ),
      ],
    );
  }
}
