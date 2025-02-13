import 'package:carousel_slider/carousel_slider.dart';
import 'package:cotton_valley_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/text_style.dart';
import '../../../widgets/custom_appbar.dart';
import '../../../widgets/mycustom_button.dart';
import '../../../widgets/product_custombutton.dart';
import '../../../widgets/vendors_widget.dart';
import 'product_detail_controller.dart';

class ProductdetailView extends StatefulWidget {
  const ProductdetailView({super.key});

  @override
  State<ProductdetailView> createState() => ProductdetailViewState();
}

class ProductdetailViewState extends State<ProductdetailView> {
  final ProductdetailController controller = ProductdetailController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Product Name',
            optionsicon: SvgPicture.asset(
                height: 22.h, width: 22.w, ImageConstants.optionsicon),
            // onOptionPressed: () {
            //   print("Option pressed ======>");
            // },
            
          ),
          const Divider(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider.builder(
                          itemCount: 4,
                          options: CarouselOptions(
                            height: 230.h,
                            autoPlay: true,
                            enableInfiniteScroll: true,
                            viewportFraction: 0.9,
                            enlargeCenterPage: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                controller.currentIndex = index;
                              });
                            },
                          ),
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightgreyColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Image.asset(
                                ImageConstants.menimg,
                                width: 330.w,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                        ),
                        Positioned(
                          bottom: 10.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(4, (index) {
                              return Container(
                                width: 12.w,
                                height: 8.h,
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentIndex == index
                                      ? AppColors.blackColor
                                      : AppColors.whiteColor,
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                  ),

                  ///
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Product Name',
                                style: AppTextStyles.popBold16),
                            Text('\$Price', style: AppTextStyles.popBold14),
                          ],
                        ),
                        SizedBox(height: 6.h),
                        Text('Vendor/Store', style: AppTextStyles.popRegular12),
                        SizedBox(height: 4.h),
                        Text('Category - Sub Category',
                            style: AppTextStyles.popRegular12),
                        SizedBox(height: 8.h),
                        //
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //
                            ProductCustomButton(onTap: () {}),
                            SizedBox(width: 2.w),
                            //
                            ProductCustomButton(onTap: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  /////
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: VendorsWidget(),
                  ),
                  SizedBox(height: 60.h),
                  /////
                  Center(
                    child: MycustomButton(
                      height: 39.h,
                      width: 315.w,
                      borderRadius: 6.r,
                      title: "Contact",
                      onPressed: () {},
                    ),
                  ),
                  // SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
