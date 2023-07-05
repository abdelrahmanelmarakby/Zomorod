import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zomorod/app.dart';
import 'package:get/get.dart';
import 'core/global/const.dart';
import 'core/services/get_storage_helper.dart';
import 'core/services/shared_prefs.dart';

Future<void> main() async {
  final pref = await SharedPreferences.getInstance();
  GetStorage.init();
  // Workmanager().initialize(
  //   callbackDispatcher,
  //   isInDebugMode: true,
  // );
  // Workmanager().registerPeriodicTask(
  //   "2",
  //   "simplePeriodicTask",
  //   frequency: const Duration(minutes: 60),
  // );
  globalPrefs = pref;
  Get.put(SharedPrefService(prefs: pref));
  runApp(const MyApp());
}
