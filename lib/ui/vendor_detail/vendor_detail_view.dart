import 'package:cotton_valley_app/ui/add_product/add_product_view.dart';
import 'package:cotton_valley_app/ui/product/product_controller.dart';
import 'package:cotton_valley_app/ui/product_detail/product_detail_view.dart';
import 'package:cotton_valley_app/ui/vendor_detail/vendor_detail_controller.dart';
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

import '../../widgets/circular_button.dart';
import '../../widgets/category_tabs.dart';

class VendorDetailView extends StatelessWidget {
  const VendorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    Vendordetailcontroller controller = Get.put(Vendordetailcontroller());

    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///// Custom AppBar
              CustomAppBar(
                title: 'Vendor Name',
                titleStyle: AppTextStyles.popblack16,
                searchIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, ImageConstants.searchicon),
                // onSearchPressed: () {},
                filterIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, ImageConstants.filtericon),
                onFilterPressed: () {
                  SortBottomSheet(context);
                },
                optionsicon: SvgPicture.asset(
                  height: 22.h,
                  width: 22.w,
                  ImageConstants.optionsicon,
                ),
                // onOptionPressed: () {
                //   print("Option icon tapped");
                // },
              ),
              const Divider(),

              SizedBox(
                height: 8.h,
              ),
              /////
              const CategoryTabs(
                tabs: ["All", "Clothing", "Footwear", "Electronic"],
              ),
              /////
              const CategoryTabs(
                tabs: [
                  "All",
                  "Shirts",
                  "Tops",
                  "Skirts",
                ],
              ),
              /////
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) => ProductsWidget(
                    onTap: () {
                      Get.to(() => const ProductdetailView());
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 8.h),
                ),
              ),
            ],
          ),

          ///// Circular Button
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
