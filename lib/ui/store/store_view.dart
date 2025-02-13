import 'package:cotton_valley_app/ui/store_detail/store_detail_view.dart';
import 'package:cotton_valley_app/widgets/circular_button.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/sort_bottomsheet.dart';
import 'package:cotton_valley_app/widgets/stores_widget.dart';
import 'package:cotton_valley_app/widgets/vendors_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/image_constants.dart';
import '../../widgets/custom_dropdown.dart';
import '../add_store/add_store_view.dart';
import '../add_vendor/add_vendor_view.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              ///// Custom AppBar
              CustomAppBar(
                title: 'Stores',
                searchIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, ImageConstants.searchicon),
                //onSearchPressed: () {},
                filterIcon: SvgPicture.asset(
                    height: 22.h, width: 22.w, ImageConstants.filtericon),
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
                        Get.to(() => AddStoreView());
                      },
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    CustomDropdown(
                      title: "City",
                      onTap: () {
                        Get.to(() => AddStoreView());
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  itemBuilder: (context, index) => StoresWidget(
                    onTap: () {
                      Get.to(() => const StoreDetailView());
                    },
                  ),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 8.h,
                  ),
                ),
              ),
            ],
          ),
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
