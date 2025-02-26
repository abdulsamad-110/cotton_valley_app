import 'package:cotton_valley_app/utils/app_colors.dart';
import 'package:cotton_valley_app/utils/text_style.dart';
import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:cotton_valley_app/widgets/mycustom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../bottom_sheets/sort_bottomsheet.dart';

class BookingCompleteView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///// widget
      appBar: CustomAppBar(
        title: "Booking Complete",
        titleStyle: AppTextStyles.popRegular22,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          //
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //
              CircleAvatar(
                radius: 40.r,
                backgroundColor: AppColors.redColor,
                child: Icon(Icons.check, color: Colors.white, size: 45.w),
              ),
              //
              SizedBox(height: 60.h),
              //
              Text(
                "Payment Successfully\nCompleted!",
                textAlign: TextAlign.center,
                style: AppTextStyles.popLight16,
              ),
              //
              SizedBox(height: 100.h),

              ///// widget
              MycustomButton(
                height: 39.h,
                title: "Manage Your Digi Host",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:cotton_valley_app/utils/app_colors.dart';
// import 'package:cotton_valley_app/utils/text_style.dart';
// import 'package:cotton_valley_app/widgets/custom_appbar.dart';
// import 'package:cotton_valley_app/widgets/mycustom_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';

// import 'booking_complete_controller.dart';

// class BookingCompleteView extends StatelessWidget {
//   final BookingCompleteController controller =
//       Get.put(BookingCompleteController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       /////
//       appBar: CustomAppBar(
//         title: "Booking Complete",
//         titleStyle: AppTextStyles.popRegular22,
//       ),
//       //
//       body: Center(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 30.w),
//           //
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               //
//               Obx(() => CircleAvatar(
//                     radius: 40.r,
//                     backgroundColor: AppColors.redColor,
//                     child: controller.showCheckIcon.value
//                         ? Icon(Icons.check, color: Colors.white, size: 45.w)
//                         : SizedBox(),
//                   )),
//               //
//               SizedBox(height: 60.h),
//               Text(
//                 "Payment Successfully\nCompleted!",
//                 textAlign: TextAlign.center,
//                 style: AppTextStyles.popLight16,
//               ),
//               //
//               SizedBox(height: 100.h),
//               /////
//               MycustomButton(
//                 height: 39.h,
//                 title: "Manage Your Digi Host",
//                 onPressed: controller.showTick,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
