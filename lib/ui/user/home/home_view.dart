import 'package:cotton_valley_app/ui/user/product_detail/product_detail_view.dart';
import 'package:cotton_valley_app/ui/user/store_detail/store_detail_view.dart';
import 'package:cotton_valley_app/ui/user/vendor_detail/vendor_detail_view.dart';
import 'package:cotton_valley_app/widgets/stores_widget.dart';
import 'package:cotton_valley_app/widgets/vendors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/products_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///// Custom AppBar
          CustomAppBar(title: "Home"),
          //
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///// Products Widget
                  ProductsWidget(
                    title: 'Products',
                    onTap: () {
                      Get.to(() => const ProductdetailView());
                    },
                  ),
                  SizedBox(height: 16.h),
                  ///// Vendors Widget
                  VendorsWidget(
                    title: "Vendors",
                    onTap: () {
                      Get.to(() => const VendorDetailView());
                    },
                  ),
                  SizedBox(height: 16.h),

                  ///// Stores Widget
                  StoresWidget(
                    title: 'Stores',
                    onTap: () {
                      Get.to(() => const StoreDetailView());
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
