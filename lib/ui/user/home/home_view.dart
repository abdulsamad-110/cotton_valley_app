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
      appBar: const CustomAppBar(title: "Home"),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            ///// Products Widget
            const ProductsWidget(),
            SizedBox(height: 16.h),
            ///// Vendors Widget
            const VendorsWidget(),
            SizedBox(height: 16.h),
            ///// Stores Widget
            const StoresWidget(),
          ],
        ),
      ),
    );
  }
}
