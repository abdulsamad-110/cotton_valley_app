import 'package:carousel_slider/carousel_slider.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:cotton_valley_app/widgets/product_custombutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/assets.dart';
import '../utils/app_colors.dart';
import 'custom_button.dart';

class ProductsWidget extends StatelessWidget {
  final String? title; // Optional title

  const ProductsWidget({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title!.isNotEmpty) // Show title only if provided
          Padding(
            padding: const EdgeInsets.only(left: 17.0, bottom: 8.0),
            child: Text(
              title!,
              style: AppTextStyles.popblack16,
            ),
          ),
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (context, index, realIndex) {
              return Container(
                height: 180.h,
                decoration: BoxDecoration(
                  color: AppColors.lightgreyColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(6, (index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Image.asset(
                                  Assets.menimg,
                                  height: 93.h,
                                  width: 80.w,
                                  fit: BoxFit.cover,
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Product Name',
                              style: AppTextStyles.popBold16,
                            ),
                            Text(
                              '\$Price',
                              style: AppTextStyles.popBold14,
                            ),
                          ],
                        ),
                        Text(
                          'Vendor/Store',
                          style: AppTextStyles.popRegular12,
                        ),
                        Text(
                          'Category - Sub Category',
                          style: AppTextStyles.popRegular12,
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // MycustomButton(
                            //     backgroundColor: AppColors.redColor,
                            //     borderRadius: 6.r,
                            //     title: 'keyword',
                            //     titleTextStyle: AppTextStyles.popWhite8,
                            //     height: 20.h,
                            //     width: 47.w,
                            //     onPressed: () {}),
                            // SizedBox(width: 2.w),
                            // MycustomButton(
                            //     backgroundColor: AppColors.redColor,
                            //     borderRadius: 6.r,
                            //     title: 'keyword',
                            //     titleTextStyle: AppTextStyles.popWhite8,
                            //     height: 20.h,
                            //     width: 47.w,
                            //     onPressed: () {}),
                            ProductCustomButton(onTap: () {}),
                            SizedBox(width: 2.w),
                            ProductCustomButton(onTap: () {}),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 200.h,
              enlargeCenterPage: true,
              enableInfiniteScroll: true,
              scrollDirection: Axis.horizontal,
              autoPlay: false,
              viewportFraction: 0.9,
            ),
          ),
        ),
      ],
    );
  }
}
