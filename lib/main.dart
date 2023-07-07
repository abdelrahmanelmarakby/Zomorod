import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zomorod/app.dart';
import 'package:get/get.dart';
import 'core/global/const.dart';
import 'core/services/get_storage_helper.dart';
import 'core/services/network_service.dart/dio_helper.dart';
import 'core/services/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();
  DioHelper.init();
  await GetStorage.init();
  log(CacheHelper.getUserToken.toString());
  globalPrefs = pref;

  Get.put(SharedPrefService(prefs: pref));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}
