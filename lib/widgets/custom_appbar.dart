import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../ui/add_vendor/add_vendor_view.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? backIcon;
  final double backIconSize;
  final TextStyle? titleStyle;
  final Widget? cancelIcon;
  final Widget? searchIcon;
  final Widget? filterIcon;
  final Widget? optionsicon;
  final Function()? onBackPressed;
  final Function()? onFilterPressed;

  CustomAppBar({
    Key? key,
    this.title,
    this.backIcon,
    this.backIconSize = 24.0,
    this.titleStyle,
    this.searchIcon,
    this.filterIcon,
    this.optionsicon,
    this.onBackPressed,
    this.onFilterPressed,
    this.cancelIcon,
  }) : super(key: key);

  final ValueNotifier<bool> isSearching = ValueNotifier(false);
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isSearching,
      builder: (context, searching, child) {
        return AppBar(
          backgroundColor: AppColors.whiteColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          titleSpacing: 10.w,
          centerTitle: backIcon == null, // Jab backIcon na ho to title center ho
          leading: searching
              ? GestureDetector(
                  onTap: () {
                    isSearching.value = false;
                    searchController.clear();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: cancelIcon ?? const Icon(Icons.close, color: AppColors.blackColor),
                  ),
                )
              : backIcon != null
                  ? GestureDetector(
                      onTap: onBackPressed ?? () => Navigator.pop(context),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: backIconSize,
                          height: backIconSize,
                          child: backIcon,
                        ),
                      ),
                    )
                  : null,
          title: searching
              ? TextField(
                  controller: searchController,
                  autofocus: true,
                  decoration: const InputDecoration(border: InputBorder.none),
                  style: const TextStyle(color: AppColors.blackColor),
                )
              : title != null
                  ? Text(
                      title!,
                      style: titleStyle ?? AppTextStyles.popBold17,
                    )
                  : null,
          actions: [
            if (!searching && searchIcon != null)
              GestureDetector(
                onTap: () => isSearching.value = true,
                child: Padding(
                  padding: EdgeInsets.only(right: 10.r),
                  child: searchIcon!,
                ),
              ),
            if (filterIcon != null)
              GestureDetector(
                onTap: onFilterPressed ?? () => print("Filter icon tapped"),
                child: Padding(
                  padding: EdgeInsets.only(right: 10.r),
                  child: filterIcon!,
                ),
              ),
            if (optionsicon != null)
              Padding(
                padding: EdgeInsets.only(right: 5.r),
                child: PopupMenuButton<String>(
                  color: AppColors.whiteColor,
                  onSelected: (value) {
                    if (value == 'edit') {
                      Get.to(() => AddVendorView());
                    } else if (value == 'delete') {
                      Get.snackbar('Action', 'Delete tapped');
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(value: 'edit', child: Text('Edit')),
                    const PopupMenuItem(value: 'delete', child: Text('Delete')),
                  ],
                  child: optionsicon!,
                ),
              ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// 'package:cotton_valley_app/ui/add_vendor/add_vendor_view.dart';
// import 'package:cotton_valley_app/utils/app_colors.dart';
// import 'package:cotton_valley_app/utils/text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String? title;
//   final Widget? backIcon;
//   final double backIconSize;
//   final TextStyle? titleStyle;
//   final Widget? cancelIcon;
//   final Widget? searchIcon;
//   final Widget? filterIcon;
//   final Widget? optionsicon;
//   final Function()? onBackPressed;
//   final Function()? onFilterPressed;

//   CustomAppBar({
//     Key? key,
//     this.title,
//     this.backIcon,
//     this.backIconSize = 24.0,
//     this.titleStyle,
//     this.searchIcon,
//     this.filterIcon,
//     this.optionsicon,
//     this.onBackPressed,
//     this.onFilterPressed,
//     this.cancelIcon,
//   }) : super(key: key);

//   ///// State management using ValueNotifier
//   final ValueNotifier<bool> isSearching = ValueNotifier(false);
//   final TextEditingController searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//       valueListenable: isSearching,
//       builder: (context, searching, child) {
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10.w),
//           child: AppBar(
//             backgroundColor: AppColors.whiteColor,
//             surfaceTintColor: Colors.transparent,
//             elevation: 0,
//             titleSpacing: 10.w,
//             leading: searching
//                 ? GestureDetector(
//                     onTap: () {
//                       isSearching.value = false;
//                       searchController.clear();
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 8.0),
//                       child: cancelIcon ??
//                           const Icon(Icons.close, color: AppColors.blackColor),
//                     ),
//                   )
//                 : backIcon != null
//                     ? GestureDetector(
//                         onTap: onBackPressed ?? () => Navigator.pop(context),
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 8.0),
//                           child: SizedBox(
//                             width: backIconSize,
//                             height: backIconSize,
//                             child: backIcon,
//                           ),
//                         ),
//                       )
//                     : null,
//             title: searching
//                 ? TextField(
//                     controller: searchController,
//                     autofocus: true,
//                     decoration: const InputDecoration(
//                       //hintText: "Search...",
//                       border: InputBorder.none,
//                       // hintStyle: TextStyle(color: Colors.grey),
//                     ),
//                     style: const TextStyle(color: AppColors.blackColor),
//                   )
//                 : title != null
//                     ? Text(
//                         title!,
//                         style: titleStyle ?? AppTextStyles.popBold17,
//                       )
//                     : null,
//             actions: [
//               if (!searching && searchIcon != null)
//                 GestureDetector(
//                   onTap: () => isSearching.value = true,
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 10.r),
//                     child: searchIcon!,
//                   ),
//                 ),
//               if (filterIcon != null)
//                 GestureDetector(
//                   onTap: onFilterPressed ?? () => print("Filter icon tapped"),
//                   child: Padding(
//                     padding: EdgeInsets.only(right: 10.r),
//                     child: filterIcon!,
//                   ),
//                 ),
//               if (optionsicon != null)
//                 Padding(
//                   padding: EdgeInsets.only(right: 5.r),
//                   child: PopupMenuButton<String>(
//                     color: AppColors.whiteColor,
//                     onSelected: (value) {
//                       if (value == 'edit') {
//                         Get.to(() => AddVendorView());
//                       } else if (value == 'delete') {
//                         Get.snackbar('Action', 'Delete tapped');
//                       }
//                     },
//                     itemBuilder: (context) => [
//                       const PopupMenuItem(
//                         value: 'edit',
//                         child: Text('Edit'),
//                       ),
//                       const PopupMenuItem(
//                         value: 'delete',
//                         child: Text('Delete'),
//                       ),
//                     ],
//                     child: optionsicon!,
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }