import 'package:flutter/material.dart' hide SearchController;

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zomorod/core/extensions/num.dart';
import 'package:zomorod/core/resourses/sizes_manager.dart';

import '../../../../core/resourses/color_manger.dart';
import '../../../../core/resourses/styles_manger.dart';
import '../../../../core/services/theme.dart';
import '../controllers/search_controller.dart';
import 'widgets/serach_input.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class HomeAppBar extends GetWidget<SearchController>
    implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    //final themeMode = ref.watch(themeProvider);

    return AppBar(
      elevation: 0,
      backgroundColor: ColorsManager.primary,
      scrolledUnderElevation: 0,
      centerTitle: false,
      leadingWidth: 66.h,
      titleSpacing: Sizes.size8,
      actions: [
        InkWell(
          child: Container(
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? ColorsManager.veryDarkGrey
                    : ColorsManager.offWhite,
                borderRadius: BorderRadius.circular(12.w)),
            height: 40.h,
            width: 40.h,
            child: Center(
              child: Icon(
                Iconsax.message,
                size: Sizes.size16.h,
              ),
            ),
          ),
        ),
        Sizes.size8.w.widthSizedBox,
        InkWell(
          onTap: () => ThemeService().switchTheme(),
          child: Container(
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? ColorsManager.veryDarkGrey
                    : ColorsManager.offWhite,
                borderRadius: BorderRadius.circular(12.w)),
            height: 40.h,
            width: 40.h,
            child: Center(
              child: Badge(
                backgroundColor: ColorsManager.error,
                child: Icon(
                  Iconsax.notification,
                  size: Sizes.size16.h,
                ),
              ),
            ),
          ),
        ),
        Sizes.size8.w.widthSizedBox,
        InkWell(
          onTap: () => ThemeService().switchTheme(),
          child: Container(
            decoration: BoxDecoration(
              color: context.isDarkMode
                  ? ColorsManager.veryDarkGrey
                  : ColorsManager.offWhite,
              borderRadius: BorderRadius.circular(12.w),
            ),
            height: 40.h,
            width: 60.h,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "50",
                    style: StylesManager.medium(color: Colors.orangeAccent),
                  ),
                  Sizes.size4.w.widthSizedBox,
                  Icon(
                    Iconsax.coin,
                    size: Sizes.size16.h,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ),
        ),
        Sizes.size8.widthSizedBox,
      ],
      title: SearchInput(
        hintText: 'search',
        textController: TextEditingController(),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(64);
}
