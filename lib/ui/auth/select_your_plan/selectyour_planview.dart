import 'package:carousel_slider/carousel_slider.dart';
import 'package:cotton_valley_app/ui/auth/select_your_plan/selectyour_plancontroller.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../utils/app_colors.dart';

class SelectyourPlanview extends StatelessWidget {
  const SelectyourPlanview({super.key});

  @override
  Widget build(BuildContext context) {
    final SelectyourPlancontroller controller =
        Get.put(SelectyourPlancontroller());

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Select Your Plan',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Your investment will be fully return",
              style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 30.h),

            // Carousel Slider
            CarouselSlider.builder(
              itemCount: 2,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  height: 300.h,
                  decoration: BoxDecoration(
                    color: AppColors.lightgreyColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Business'),
                        SizedBox(height: 20.h),
                        Text('Business'),
                        SizedBox(height: 20.h),
                        Text('Business'),
                        SizedBox(height: 20.h),
                        Text('Business'),
                        SizedBox(height: 20.h),
                        MycustomButton(
                          height: 39.h,
                          title: "Choose",
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 300.h,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                viewportFraction: 0.9,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index; 
                },
              ),
            ),

            SizedBox(height: 30.h),

            // Dot Indicator
            Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: controller.currentIndex.value,
                count: 2,
                effect: WormEffect(
                  dotHeight: 12.h,
                  dotWidth: 30.w,
                  activeDotColor: AppColors.redColor,
                  dotColor: AppColors.lightgreyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
