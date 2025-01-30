import 'package:cotton_valley_app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Home",
      ),
      body: Column(
        children: [
          //
          const Divider(),
          //
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  
                ],
              ),
            ),
          )
          // Column(
          //   children: [

          //   ],
          // ),
        ],
      ),
    );
  }
}
