import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_colors.dart';
import '../utils/text_style.dart';

class CategoryTabs extends StatelessWidget {
  final List<String> tabs;

  const CategoryTabs({
    super.key,
    this.tabs = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18, right: 18),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DefaultTabController(
              initialIndex: 0,
              length: tabs
                  .length, // Dynamically set length based on the passed tabs
              child: Column(
                children: [
                  ButtonsTabBar(
                    backgroundColor: AppColors.redColor,
                    unselectedBackgroundColor: AppColors.lightgreyColor,
                    unselectedLabelStyle: AppTextStyles.popRegular14,
                    splashColor: const Color.fromARGB(255, 245, 4, 84),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setWidth(14.w),
                    ),
                    //labelSpacing: 20,
                    labelStyle: AppTextStyles.popMediumbtn14,
                    tabs: tabs
                        .map((tab) => Tab(text: tab))
                        .toList(), // Dynamically generate tabs from the list
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
