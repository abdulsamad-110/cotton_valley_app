import 'package:carousel_slider/carousel_slider.dart';
import 'package:cotton_valley_app/ui/booking_complete/booking_completeview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../widgets/mycustom_button.dart';
import '../selectyour_plancontroller.dart';

class ChoosePlanWidget extends StatelessWidget {
  const ChoosePlanWidget({
    super.key,
    required this.controller,
  });

  final SelectyourPlancontroller controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColors.blackColor.withOpacity(0.2),
                blurRadius: 12,
                spreadRadius: 3,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CarouselSlider.builder(
              itemCount: controller.yourplan.length,
              itemBuilder: (context, index, realIndex) {
                var plan = controller.yourplan[index]; // Plan data

                return Container(
                  decoration: BoxDecoration(
                    color: AppColors.lightgreyColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          plan['title'],
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.h),

                        Text(
                          plan['subtitle'],
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                        ),
                        SizedBox(height: 16.h),

                        // Plan Features
                        Text(plan['text1'], style: TextStyle(fontSize: 13.sp)),
                        SizedBox(height: 10.h),
                        Text(plan['text2'], style: TextStyle(fontSize: 13.sp)),
                        SizedBox(height: 10.h),
                        Text(plan['text3'], style: TextStyle(fontSize: 13.sp)),
                        SizedBox(height: 10.h),
                        Text(plan['text4'], style: TextStyle(fontSize: 13.sp)),
                        SizedBox(height: 10.h),

                        if (plan.containsKey('text5'))
                          Text(plan['text5'],
                              style: TextStyle(fontSize: 13.sp)),

                        if (plan.containsKey('text7'))
                          Text(plan['text7'],
                              style: TextStyle(fontSize: 13.sp)),

                        SizedBox(height: 18.h),

                        ///// Dashed Divider
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            26,
                            (index) => Container(
                              width: 5.w,
                              height: 1.5.h,
                              color: Colors.black45,
                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                            ),
                          ),
                        ),

                        SizedBox(height: 18.h),

                        ///// Price
                        Text(
                          plan.containsKey('text7')
                              ? plan['text7']
                              : plan['text5'],
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 40.h),

                        MycustomButton(
                          height: 39.h,
                          title: "Choose",
                          onPressed: () {
                            Get.to(() =>  BookingCompleteView());
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 460.h,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                autoPlay: false,
                viewportFraction: 1.0.w,
                onPageChanged: (index, reason) {
                  controller.currentIndex.value = index;
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
