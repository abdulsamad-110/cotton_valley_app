import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cotton_valley_app/ui/auth/select_your_plan/selectyour_plancontroller.dart';
import 'package:cotton_valley_app/ui/auth/select_your_plan/widgets/plan_widget.dart';
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
        padding: EdgeInsets.only(left: 50.w, right: 50.w, bottom: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //SizedBox(height: 0.h),

            ///// Heading Text
            Text(
              "Your investment will be fully returned",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 20.h),

            ///// Widget
            ChoosePlanWidget(controller: controller),

            SizedBox(height: 20.h),

            ///// Dot Indicator
            Obx(
              () => AnimatedSmoothIndicator(
                activeIndex: controller.currentIndex.value,
                count: 2,
                effect: WormEffect(
                  dotHeight: 8.h,
                  dotWidth: 30.w,
                  activeDotColor: AppColors.redColor,
                  dotColor: AppColors.lightgreyColor,
                ),
              ),
            ),
            // SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
