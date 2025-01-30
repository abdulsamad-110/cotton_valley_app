import 'package:cotton_valley_app/ui/user/navigation/navigation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home/home_view.dart';

class NavigationView extends StatelessWidget {
  final controller = Get.put(NavigationController());

  final pages = [
    const HomeView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
            index: controller.selectedIndex.value, children: pages),
      ),
      bottomNavigationBar: Obx(
        () => Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Container(
              color: Colors.black,
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: const Color(0xffF15B55),
                unselectedItemColor: Colors.black,
                showSelectedLabels: false, // Disable selected labels
                showUnselectedLabels: false, // Disable unselected labels
                onTap: (index) {
                  controller.changeIndex(index);
                },
                currentIndex: controller.selectedIndex.value,
                iconSize: 30, // Adjust icon size to make them bigger or smaller
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_online_outlined),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_2_outlined),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_border_outlined),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.emoji_events_outlined),
                    label: "",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
