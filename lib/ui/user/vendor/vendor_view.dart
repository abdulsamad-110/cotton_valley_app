import 'package:cotton_valley_app/ui/user/addvendor/addvendor_view.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/custom_dropdown.dart';
import 'package:cotton_valley_app/widgets/products_widget.dart';
import 'package:cotton_valley_app/widgets/vendors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../utils/assets.dart';
import '../../../widgets/circular_button.dart';
import '../../../widgets/sort_bottomsheet.dart';

class VendorView extends StatelessWidget {
  const VendorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          children: [
            ///// customwidget
            CustomAppBar(
              title: 'Vendors',
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
            /////
            Padding(
              padding: const EdgeInsets.only(top: 0, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdown(
                    title: "Country",
                    onTap: () {
                      Get.to(() => AddvendorView());
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomDropdown(
                    title: "City",
                    onTap: () {
                      Get.to(() => AddvendorView());
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) => const VendorsWidget(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 8.h,
                ),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 20.h,
          right: 20.w,
          child: const CircularButton(),
        ),
      ]),
    );
  }
}
