// import 'package:cotton_valley_app/ui/navigation/navigation_controller.dart';
// import 'package:cotton_valley_app/ui/product/product_view.dart';
// import 'package:cotton_valley_app/ui/setting/setting_view.dart';
// import 'package:cotton_valley_app/ui/store/store_view.dart';
// import 'package:cotton_valley_app/ui/vendor/vendor_view.dart';
// import 'package:cotton_valley_app/utils/app_colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import '../../utils/image_constants.dart';
// import '../home/home_view.dart';

// class NavigationView extends StatelessWidget {
//   final controller = Get.put(NavigationController());

//   final pages = [
//     const HomeView(),
//     const ProductView(),
//     const VendorView(),
//     const StoreView(),
//     const SettingView()
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         () => IndexedStack(
//             index: controller.selectedIndex.value, children: pages),
//       ),
//       bottomNavigationBar: Obx(
//         () => Padding(
//           padding: const EdgeInsets.all(20),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Container(
//               child: BottomNavigationBar(
//                 backgroundColor: AppColors.lightgreyColor,
//                 type: BottomNavigationBarType.fixed,
//                 selectedItemColor: AppColors.redColor,
//                 unselectedItemColor: AppColors.blackColor,
//                 showSelectedLabels: false,
//                 showUnselectedLabels: false,
//                 onTap: (index) {
//                   controller.changeIndex(index);
//                 },
//                 currentIndex: controller.selectedIndex.value,
//                 // iconSize: 30,
//                 items: [
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(
//                       ImageConstants.homeicon,
//                       colorFilter: ColorFilter.mode(
//                         controller.selectedIndex.value == 0
//                             ? AppColors.redColor
//                             : AppColors.blackColor,
//                         BlendMode.srcIn,
//                       ),
//                       height: 30.h,
//                       width: 30.w,
//                     ),
//                     label: "",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(
//                       ImageConstants.producticon,
//                       colorFilter: ColorFilter.mode(
//                         controller.selectedIndex.value == 1
//                             ? AppColors.redColor
//                             : AppColors.blackColor,
//                         BlendMode.srcIn,
//                       ),
//                       height: 30.h,
//                       width: 30.w,
//                     ),
//                     label: "",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(
//                       ImageConstants.vendoricon,
//                       colorFilter: ColorFilter.mode(
//                         controller.selectedIndex.value == 2
//                             ? AppColors.redColor
//                             : AppColors.blackColor,
//                         BlendMode.srcIn,
//                       ),
//                       height: 30.h,
//                       width: 30.w,
//                     ),
//                     label: "",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(
//                       ImageConstants.storeicon,
//                       colorFilter: ColorFilter.mode(
//                         controller.selectedIndex.value == 3
//                             ? AppColors.redColor
//                             : AppColors.blackColor,
//                         BlendMode.srcIn,
//                       ),
//                       height: 30.h,
//                       width: 30.w,
//                     ),
//                     label: "",
//                   ),
//                   BottomNavigationBarItem(
//                     icon: SvgPicture.asset(
//                       ImageConstants.settingicon,
//                       colorFilter: ColorFilter.mode(
//                         controller.selectedIndex.value == 4
//                             ? AppColors.redColor
//                             : AppColors.blackColor,
//                         BlendMode.srcIn,
//                       ),
//                       height: 30.h,
//                       width: 30.w,
//                     ),
//                     label: "",
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/image_constants.dart';
import '../home/home_view.dart';
import '../product/product_view.dart';
import '../vendor/vendor_view.dart';
import '../store/store_view.dart';
import '../setting/setting_view.dart';
import 'navigation_controller.dart';

class NavigationView extends StatelessWidget {
  NavigationView({super.key});

  final NavigationController controller = Get.put(NavigationController());

  final List<Widget> pages = [
    const HomeView(),
    const ProductView(),
    const VendorView(),
    const StoreView(),
    const SettingView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.selectedIndex.value,
            children: pages,
          )),
      bottomNavigationBar: Obx(() => Padding(
            padding: const EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36.r),
              child: BottomNavigationBar(
                backgroundColor: AppColors.lightgreyColor,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColors.redColor,
                unselectedItemColor: AppColors.blackColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeIndex,
                items: List.generate(5, (index) => _buildNavItem(index)),
              ),
            ),
          )),
    );
  }

  BottomNavigationBarItem _buildNavItem(int index) {
    final icons = [
      ImageConstants.homeicon,
      ImageConstants.producticon,
      ImageConstants.vendoricon,
      ImageConstants.storeicon,
      ImageConstants.settingicon,
    ];

    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(
          top: 5.h,
        ),
        child: SvgPicture.asset(
          icons[index],
          colorFilter: ColorFilter.mode(
            controller.selectedIndex.value == index
                ? AppColors.redColor
                : AppColors.blackColor,
            BlendMode.srcIn,
          ),
          height: 26.h,
          width: 26.w,
        ),
      ),
      label: "",
    );
  }
}
