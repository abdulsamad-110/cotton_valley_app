import 'package:cotton_valley_app/ui/user/addproduct/add_productview.dart';
import 'package:cotton_valley_app/ui/user/product/product_controller.dart';
import 'package:cotton_valley_app/ui/user/vendor_detail/vendordetail_controller.dart';
import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/assets.dart';
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
import '../../../widgets/categorytabs.dart';

class VendorDetailView extends StatelessWidget {
  const VendorDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    Vendordetailcontroller controller = Get.put(Vendordetailcontroller());

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ///// Custom AppBar
              CustomAppBar(
                title: 'Vendor Name',
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

              SizedBox(
                height: 8.h,
              ),
              /////
              const CategoryTabs(),
              /////
              const CategoryTabs(
                tabs: ["All", "Shirts", "Tops", "Skirts"],
              ),
              /////
              Expanded(
                child: ListView.separated(
                  itemCount: 3,
                  itemBuilder: (context, index) => const ProductsWidget(),
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
