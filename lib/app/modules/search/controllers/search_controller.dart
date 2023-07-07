import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/api/search_apis.dart';
import '../../../data/models/search_model.dart';

class SearchController extends GetxController {
  final searchController = TextEditingController();

  SearchModel? searchModel;
  Future<SearchModel?> search(String query) async {
    searchModel = await SearchApis.search(query);

    update();
    return searchModel;
  }
}
