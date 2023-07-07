import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:zomorod/core/services/network_service.dart/dio_helper.dart';

import '../models/search_model.dart';

class SearchApis {
  static Future<SearchModel?> search(String query) async {
    final request = await Dio().get(
        "https://youtube.googleapis.com/youtube/v3/search?part=snippet&q=$query&key=AIzaSyBc91am_Bx5R9ngk4nGqFm2xqCZkvvif2A");

    SearchModel searchModel = SearchModel.fromJson(request.data);

    return searchModel;
  }
}
