import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:zomorod/core/services/shared_prefs.dart';

import '../../../core/global/const.dart';
import '../../../core/services/network_service.dart/dio_network_service.dart';
import '../models/sign_in_model.dart';
import '../models/signup_model.dart';

class AuthApis {
  static Future<SignupModel?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: APIKeys.register,
      headers: {
        'Accept': 'application/json',
        // 'Authorization':
        //     'Bearer ${SharedPrefService(prefs: globalPrefs).getToken()}',
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap(
          {"email": email, "name": name, "password": password},
        ),
      ),
    );
    final response = await networkService.execute(
        request, (json) => SignupModel.fromJson(json));
    final data = response.maybeWhen(
      ok: (data) {
        return data;
      },
      unProcessable: (data) {
        BotToast.showText(text: data.errors[0]);
        return data;
      },
      orElse: () {},
      badRequest: (data) {
        BotToast.showText(text: data.errors[0]);

        return data;
      },
      conflict: (data) {
        return data;
      },
      invalidParameters: (data) {
        BotToast.showText(text: data.errors[0]);

        return data;
      },
      noAccess: (data) {
        BotToast.showText(text: data.errors[0]);

        return data;
      },
      noData: (data) {
        return data;
      },
      notFound: (data) {
        BotToast.showText(text: data.errors[0]);

        return data;
      },
    );
    return data;
  }

  static Future<SigninModel?> login({
    required String email,
    required String password,
  }) async {
    final request = NetworkRequest(
      type: NetworkRequestType.POST,
      path: APIKeys.login,
      headers: {
        'Accept': 'application/json',
        // 'Authorization':
        //     'Bearer ${SharedPrefService(prefs: globalPrefs).getToken()}',
      },
      data: NetworkRequestBody.fromData(
        FormData.fromMap(
          {"email": email, "password": password},
        ),
      ),
    );
    final response = await networkService.execute(
        request, (json) => SigninModel.fromJson(json));
    final data = response.maybeWhen(
      ok: (data) {
        return data;
      },
      orElse: () {},
      badRequest: (data) {
        return data;
      },
      conflict: (data) {
        return data;
      },
      invalidParameters: (data) {
        return data;
      },
      noAccess: (data) {
        return data;
      },
      noData: (data) {
        return data;
      },
      notFound: (data) {
        return data;
      },
      unProcessable: (data) {
        return data;
      },
    );
    return data;
  }
}
