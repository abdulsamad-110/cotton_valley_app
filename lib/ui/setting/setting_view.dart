import 'package:cotton_valley_app/ui/account_management/account_management_view.dart';
import 'package:cotton_valley_app/ui/setting/setting_controller.dart';
import 'package:cotton_valley_app/utils/image_constants.dart';
import 'package:cotton_valley_app/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../widgets/custom_appbar.dart';
import '../../utils/text_style.dart';
import '../../utils/app_colors.dart';

class SettingView extends StatelessWidget {
  SettingView({super.key});
  SettingController controller = Get.put(SettingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Settings'),
          const Divider(),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    "Account Management",
                    style: AppTextStyles.popblack16,
                  ),
                  trailing: SvgPicture.asset(
                    ImageConstants.nextimg,
                    width: 18,
                    height: 18,
                  ),
                  onTap: () {
                    Get.to(() => AccountManagementView());
                  },
                ),
                ListTile(
                  title: Text(
                    "Help Center",
                    style: AppTextStyles.popblack16,
                  ),
                  trailing: SvgPicture.asset(
                    ImageConstants.nextimg,
                    width: 18,
                    height: 18,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Privacy Policy",
                    style: AppTextStyles.popblack16,
                  ),
                  trailing: SvgPicture.asset(
                    ImageConstants.nextimg,
                    width: 20,
                    height: 20,
                  ),
                  onTap: () {},
                ),
                ListTile(
                  title: Text(
                    "Terms & Conditions",
                    style: AppTextStyles.popblack16,
                  ),
                  trailing: SvgPicture.asset(
                    ImageConstants.nextimg,
                    width: 18,
                    height: 18,
                  ),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    "Logout",
                    style: AppTextStyles.popblack16.copyWith(
                      color: AppColors.redColor,
                    ),
                  ),
                  trailing: SvgPicture.asset(
                    ImageConstants.nextimg,
                    width: 18,
                    height: 18,
                    colorFilter: const ColorFilter.mode(
                      AppColors.redColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  onTap: () {
                    LogoutBottomSheet(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
