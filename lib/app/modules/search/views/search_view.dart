import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zomorod/core/extensions/num.dart';
import 'package:zomorod/core/resourses/sizes_manager.dart';
import 'package:zomorod/data/data.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../../../../core/services/theme.dart';
import '../../../../widgets/video_card.dart';
import '../../../data/api/search_apis.dart';
import '../../../data/models/search_model.dart';
import '../controllers/search_controller.dart';
import 'widgets/serach_input.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SearchAppBar(),
        body: GetBuilder(
          builder: (SearchController controller) => FutureBuilder<SearchModel?>(
            future: controller.search(controller.searchController.text),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                SearchModel? searchData = snapshot.data;

                return ListView.builder(
                    itemCount: searchData?.items?.length ?? 0,
                    itemBuilder: (context, index) => VideoCard(
                        video: Video(
                            searchData?.items?[index].snippet?.thumbnails?.high
                                    ?.url ??
                                "",
                            searchData?.items?[index].snippet?.title ?? "",
                            Channel(searchData
                                    ?.items?[index].snippet?.channelTitle ??
                                ""),
                            DateTime.parse(searchData
                                    ?.items?[index].snippet?.publishTime ??
                                "")),
                        data: const {}));
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            },
          ),
        ));
  }
}

class SearchAppBar extends GetWidget<SearchController>
    implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleSpacing: Sizes.size8,
      title: SearchInput(
        hintText: 'search',
        textController: controller.searchController,
        onSubmitted: (query) async {
          await SearchApis.search(query);
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
