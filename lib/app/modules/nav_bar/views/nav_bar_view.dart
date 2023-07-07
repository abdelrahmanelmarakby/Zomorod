import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../data/colors.dart';
import '../../../../screens/home_screen.dart';
import '../../../../screens/library_screen.dart';
import '../../../../screens/subscription_screen.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarView extends GetView<NavBarController> {
  const NavBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
      builder: (controller) => Scaffold(
          body: SafeArea(
            child: Stack(
              children: controller.screens
                  .asMap()
                  .map(
                    (i, screen) => MapEntry(
                      i,
                      Offstage(
                        offstage: controller.selectedIndex != i,
                        child: screen,
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Get.isDarkMode ? Colors.black : Colors.white,
              selectedItemColor: linkBlue,
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.selectedIndex,
              onTap: (i) {
                controller.selectedIndex = i;
                controller.update();
              },
              selectedFontSize: 10.0,
              unselectedFontSize: 10.0,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outlined),
                  activeIcon: Icon(Icons.add_circle),
                  label: 'Add',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions_outlined),
                  activeIcon: Icon(Icons.subscriptions),
                  label: 'Subscriptions',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.video_library_outlined),
                  activeIcon: Icon(Icons.video_library),
                  label: 'Library',
                ),
              ])),
    );
  }
}
