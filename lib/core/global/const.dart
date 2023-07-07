import 'package:shared_preferences/shared_preferences.dart';

import '../services/get_storage_helper.dart';
import '../services/network_service.dart/dio_network_service.dart';

const String dummyImage0 = "https://picsum.photos/800";
const String dummyImage1 = "https://picsum.photos/900";
const String dummyImage2 = "https://picsum.photos/1000";
const String dummyImage3 = "https://picsum.photos/1100";
const String dummyImage4 = "https://picsum.photos/1200";
const String emptyImage =
    "https://assets2.lottiefiles.com/private_files/lf30_e3pteeho.json";
final NetworkService networkService = NetworkService(
  baseUrl: APIKeys.baseUrl,
  httpHeaders: {
    'Authorization': 'Bearer ${CacheHelper.getUserToken}',
    'Accept': 'application/json',
    'lang': CacheHelper.getLocale,
  },
);

late final SharedPreferences globalPrefs;

class APIKeys {
  static String baseUrl = "https://youtube.softscope.net";
  static String login = "/api/auth/login";
  static String register = "/api/auth/register";
  static String profile = "/api/auth/profile";
}
