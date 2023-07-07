import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../screens/home_screen.dart';
import '../../../../screens/library_screen.dart';
import '../../../../screens/subscription_screen.dart';

class NavBarController extends GetxController {
  int selectedIndex = 0;
  final screens = [
    HomeScreen(),
    const Scaffold(body: Center(child: Text('Add'))),
    const Subscription(),
    const LibraryTab(),
  ];
}
