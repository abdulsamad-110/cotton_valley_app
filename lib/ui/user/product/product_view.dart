import 'package:cotton_valley_app/ui/user/product/product_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:cotton_valley_app/widgets/products_widget.dart';
import 'package:cotton_valley_app/widgets/sort_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../../../widgets/circular_button.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ///// Custom AppBar
              CustomAppBar(
                title: 'Products',
                searchIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, Assets.searchicon),
                onSearchPressed: () {},
                filterIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, Assets.filtericon),
                onFilterPressed: () {
                  SortBottomSheet(context);
                },
              ),
              const Divider(),

              ///// Filter Buttons
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    MycustomButton(
                      height: 33.h,
                      width: 100.w,
                      borderRadius: 6.r,
                      title: 'Vendor',
                      onPressed: () {},
                    ),
                    SizedBox(width: 4.w),
                    MycustomButton(
                      backgroundColor: AppColors.lightgreyColor,
                      borderRadius: 6.r,
                      title: 'Store',
                      hasBorder: true,
                      titleTextStyle: TextStyle(
                        color: AppColors.blackColor,
                      ),
                      width: 100.w,
                      height: 33.h,
                      onPressed: () {},
                    )
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.horizontal, // Enable horizontal scrolling
                  child: Row(
                    children: [
                      DefaultTabController(
                        initialIndex: 1,
                        length: 4,
                        child: Column(
                          children: [
                            ButtonsTabBar(
                              backgroundColor: AppColors.redColor,
                              unselectedBackgroundColor:
                                  AppColors.lightgreyColor,
                              unselectedLabelStyle:
                                  TextStyle(color: Colors.black),
                              splashColor:
                                  const Color.fromARGB(255, 245, 4, 84),
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: ScreenUtil().setWidth(28.w),
                              ),
                              labelSpacing: 10,
                              labelStyle: AppTextStyles.popMediumbtn14,
                              tabs: const [
                                Tab(text: "All"),
                                Tab(text: "Clothing"),
                                Tab(text: "Footwear"),
                                Tab(text: "Electronic"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /////
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) => const ProductsWidget(),
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                ),
              ),
            ],
          ),

          ///// Floating Circular Button
          Positioned(
            bottom: 20.h,
            right: 20.w,
            child: const CircularButton(),
          ),
        ],
      ),
    );
  }
}
