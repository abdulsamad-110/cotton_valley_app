import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OtpCustomField extends StatelessWidget {
  const OtpCustomField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomField(),
        CustomField(),
        CustomField(),
        CustomField(),
        CustomField(),
        CustomField(),
      ],
    );
  }
}

class CustomField extends StatelessWidget {
  final bool isNumberKeyboard; // Add a variable to control the keyboard type

  const CustomField(
      {super.key, this.isNumberKeyboard = true}); 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 46.w,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        textAlign: TextAlign.center,
        style: AppTextStyles.popRegular10,
        keyboardType: isNumberKeyboard
            ? TextInputType.number
            : TextInputType.text, // Switch based on the flag
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.lightgreyColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.lightgreyColor,
                )),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: AppColors.lightgreyColor,
                ))),
      ),
    );
  }
}
