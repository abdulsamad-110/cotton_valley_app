import 'package:flutter/material.dart';

import '../../../widgets/custom_appbar.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: const Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppBar(
            title: 'Settings',
            //searchIcon: ,
          ),
          Divider()
        ],
      ),);
  }
}