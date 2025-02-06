// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// import '../utils/app_colors.dart';
// import '../utils/text_style.dart';

// class MyCustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String hintText;
//   final String labelText;
//   final bool obscureText;
//   final TextStyle? hintTextStyle;
//   final TextInputType keyboardType;
//   final String? Function(String?)? validator;
//   final Function(String)? onSubmitted;
//   final FocusNode? focusNode;
//   final void Function(String)? onChanged;
//   bool readOnly ;

//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool? isBorder;
//   final Color borderColor;
//   final Color textColor;
//   final Color hintColor;
//   final Color fillColor;
//   final double? width;
//   final EdgeInsetsGeometry? contentPadding;
//   final double? height;
//   final BorderRadiusGeometry? borderRadius;
//   //
//   final TextInputAction textInputAction;

//   MyCustomTextField({
//     Key? key,
//     required this.controller,
//     required this.hintText,
//     this.labelText = '',
//     this.readOnly =false,
//     this.obscureText = false,
//     this.keyboardType = TextInputType.text,
//     this.validator,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.borderColor = const Color(0xff4DBBAE),
//     this.textColor = Colors.black,
//     this.hintColor = Colors.grey,
//     this.fillColor = const Color(0xffFFFFFF),
//     this.width,
//     this.height,
//     this.hintTextStyle,
//     this.isBorder = false,
//     this.contentPadding,
//     this.borderRadius,
//     this.onSubmitted,
//     this.focusNode, this.onChanged,
//     //
//     this.textInputAction = TextInputAction.next,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // padding:
//       //     EdgeInsets.only(left: 27.w, right: 17.w, top: 13.h, bottom: 13.h),
//       height: height ?? 47.h,
//       width: width ?? 315.w,
//       decoration: BoxDecoration(
//         border: isBorder == true
//             ? Border.all(color: const Color(0xFFB1B1B1), width: 1)
//             : null,
//         borderRadius: borderRadius ?? BorderRadius.circular(10.r),
//         color: AppColors.whiteColor,
//       ),
//       child: TextFormField(
//         readOnly: readOnly,
//         cursorColor: AppColors.blackColor,
//         controller: controller,
//         obscureText: obscureText,
//         textAlign: TextAlign.start,
//         focusNode: focusNode,
//         onChanged: onChanged,
//         // onFieldSubmitted: onSubmitted ??
//         //     (value) {
//         //       FocusScope.of(context).nextFocus();
//         //     },
//         //
//          textInputAction: textInputAction, // Add this
//         onFieldSubmitted: onSubmitted ?? (value) {
//           if (textInputAction == TextInputAction.next) {
//             FocusScope.of(context).nextFocus();
//           } else {
//             FocusScope.of(context).unfocus();
//           }
//         },
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           suffixIcon: suffixIcon,
//           hintText: hintText,
//           hintStyle: hintTextStyle ?? AppTextStyles.popgrey10,
//           // contentPadding: EdgeInsets.symmetric(
//           //     horizontal: 13.0.w, vertical: context.height * 0.027),
//           contentPadding: contentPadding,
//         ),
//       ),
//     );
//   }
// }
