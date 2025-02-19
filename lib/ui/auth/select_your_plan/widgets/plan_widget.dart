import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../widgets/mycustom_button.dart';
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
              itemCount: 2,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  //height: 400.h,
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Business',
                          style: TextStyle(
                              fontSize: 18.sp, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          'What You’ll Get',
                          style: TextStyle(fontSize: 15.sp, color: Colors.grey
                              //fontWeight: FontWeight.w500
                              ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Up to 3 Domains Management',
                          style: TextStyle(
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Up to 3 Hosting Management',
                          style: TextStyle(
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          '3 Users',
                          style: TextStyle(
                            fontSize: 13.sp,
                            //fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Monthly Backups',
                          style: TextStyle(
                            fontSize: 13.sp,
                            // fontWeight: FontWeight.w500
                          ),
                        ),
                        SizedBox(height: 10.h),

                        /// Dashed Divider
                        // const Divider(),
                        // DottedLine(
                        //   dashLength: 6,
                        //   lineThickness: 2,
                        //   dashColor: Colors.black,
                        // ),
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

                        SizedBox(height: 10.h),

                        Text(
                          '\$0/day',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        SizedBox(height: 10.h),
                        MycustomButton(
                          height: 39.h,
                          title: "Choose",
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                height: 355.h,
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
