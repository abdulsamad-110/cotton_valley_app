import 'package:cotton_valley_app/ui/add_vendor/add_vendor_view.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/custom_dropdown.dart';
import 'package:cotton_valley_app/widgets/products_widget.dart';
import 'package:cotton_valley_app/widgets/vendors_widget.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/image_constants.dart';
import '../../widgets/circular_button.dart';
import '../../widgets/sort_bottomsheet.dart';
import '../vendor_detail/vendor_detail_view.dart';
import 'vendor_controller.dart';

class VendorView extends StatelessWidget {
  VendorView({super.key});
  final VendorController controller = Get.put(VendorController());

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
                  height: 22.h, width: 22.w, ImageConstants.searchicon),
              // onSearchPressed: () {},
              filterIcon: SvgPicture.asset(
                  height: 22.h, width: 22.w, ImageConstants.filtericon),
              onFilterPressed: () {
                SortBottomSheet(context);
              },
            ),
            const Divider(),
            /////
            Padding(
              padding: EdgeInsets.only(top: 0, left: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdown(
                    hintText: "Country",
                    controller: controller.countryController,
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: false,
                        countryListTheme: CountryListThemeData(
                          flagSize: 18.sp,
                          textStyle: TextStyle(fontSize: 14.sp),
                          bottomSheetHeight: 500.h,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.r),
                            topRight: Radius.circular(12.r),
                          ),
                        ),
                        onSelect: (Country value) {
                          // controller.setCountry(value.name);
                        },
                      );
                      print("Country Dropdown clicked!");
                    },
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomDropdown(
                    hintText: "City",
                    onTap: () {
                      print("City Dropdown clicked!");
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                itemBuilder: (context, index) => VendorsWidget(
                  onTap: () {
                    Get.to(() => const VendorDetailView());
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
          child: CircularButton(
            onTap: () {
              Get.to(() => AddVendorView());
            },
          ),
        ),
      ]),
    );
  }
}
