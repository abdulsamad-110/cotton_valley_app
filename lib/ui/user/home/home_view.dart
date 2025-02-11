import 'package:cotton_valley_app/widgets/stores_widget.dart';
import 'package:cotton_valley_app/widgets/vendors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          const CustomAppBar(title: "Home"),
          //
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ///// Products Widget
                  const ProductsWidget(title: 'Products'),
                  SizedBox(height: 16.h),

                  ///// Vendors Widget
                  const VendorsWidget(title: "Vendors"
                  ),
                  SizedBox(height: 16.h),

                  ///// Stores Widget
                  const StoresWidget(title: 'Stores'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
