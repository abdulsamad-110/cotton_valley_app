import 'package:cotton_valley_app/ui/user/add_product/add_product_view.dart';
import 'package:cotton_valley_app/ui/user/product/product_controller.dart';
import 'package:cotton_valley_app/ui/user/product_detail/product_detail_view.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/image_constants.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:cotton_valley_app/widgets/product_custombutton.dart';
import 'package:cotton_valley_app/widgets/products_widget.dart';
import 'package:cotton_valley_app/widgets/sort_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';

import '../../../widgets/circular_button.dart';
import '../../../widgets/category_tabs.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController controller = Get.put(ProductController());

    return Scaffold(
      body: Stack(
        children: [
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///// Custom AppBar
              CustomAppBar(
                title: 'Products',
                searchIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, ImageConstants.searchicon),
                //o: () {},
                filterIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, ImageConstants.filtericon),
                onFilterPressed: () {
                  SortBottomSheet(context);
                },
              ),
              const Divider(),

              ///// Filter Buttons
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 8),
                child: Row(
                  children: [
                    //
                    Obx(() => Row(
                          children: [
                            ProductCustomButton(
                              height: 33.h,
                              width: 100.w,
                              title: 'Vendor',
                              titleTextStyle: AppTextStyles.popregular14,
                              backgroundColor: controller.isVendorSelected.value
                                  ? AppColors.redColor
                                  : AppColors.redColor,
                              onTap: () {
                                controller.toggleVendor();
                                controller.isStoreSelected.value = true;
                                Get.to(() => AddProductView());
                              },
                            ),
                            SizedBox(width: 4.w),
                            ProductCustomButton(
                              height: 33.h,
                              width: 100.w,
                              title: 'Store',
                              titleTextStyle: AppTextStyles.popRegular14,
                              backgroundColor: controller.isStoreSelected.value
                                  ? AppColors.lightgreyColor
                                  : AppColors.lightgreyColor,
                              onTap: () {
                                controller.toggleStore();
                                controller.isVendorSelected.value = false;
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              /////
              const CategoryTabs(
                tabs: ["All", "Clothing", "Footwear", "Electronic"],
              ),
              /////
              const CategoryTabs(
                tabs: ["All", "Shirts", "Tops", "Skirts"],
              ),

              /////
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) => ProductsWidget(
                    onTap: () {
                      Get.to(() => ProductdetailView());
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                ),
              ),
            ],
          ),

          ///// Circular Button
          Positioned(
            bottom: 14.h,
            right: 20.w,
            child: const CircularButton(),
          ),
        ],
      ),
    );
  }
}
