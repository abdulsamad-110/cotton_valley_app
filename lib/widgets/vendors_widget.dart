import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/assets.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class VendorsWidget extends StatelessWidget {
  const VendorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 17.0, bottom: 8.0),
            child: Text(
              'Vendors',
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
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
                                'Vendor/Store Name',
                                style: AppTextStyles.popBold16,
                              ),
                              Row(
                                children: [
                                  Image.asset(Assets.iconphone,
                                      height: 16.h, width: 16.w),
                                  SizedBox(width: 8.w),
                                  Image.asset(Assets.iconemail,
                                      height: 16.h, width: 16.w),
                                  SizedBox(width: 8.w),
                                  Image.asset(Assets.iconwechat,
                                      height: 16.h, width: 16.w),
                                  SizedBox(width: 8.w),
                                  Image.asset(Assets.iconweb,
                                      height: 16.h, width: 16.w),
                                ],
                              ),
                            ],
                          ),
                          Text(
                            'Country - City',
                            style: AppTextStyles.popRegular12,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 160.h,
                enlargeCenterPage: true,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                viewportFraction: 0.9,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
