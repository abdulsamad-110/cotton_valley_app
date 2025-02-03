import 'package:cotton_valley_app/widgets/custom_bottomsheet.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(
            title: 'Settings',
            //searchIcon: ,
          ),
          Divider(),
          Expanded(
              child: Center(
                  child: GestureDetector(
                      onTap: () {
                        LogoutBottomSheet(context);
                      },
                      child: Text("Logout"))))
        ],
      ),
    );
  }
}
