import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zomorod/data/data.dart';
import 'package:zomorod/widgets/video_card.dart';

import '../../../../core/services/theme.dart';
import '../../../../widgets/app_bar.dart';
import '../../../../widgets/util.dart';
import '../../../routes/app_pages.dart';
import '../../profile_settings/views/pages/watch_time_stats.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Padding(
        padding:
            EdgeInsets.symmetric(vertical: MediaQuery.of(context).padding.top),
        child: const AppDrawer(),
      ),
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          primary: false,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 60.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    getVideos(index, 'v3/search');
                    final video = homeScreenVideos[index];
                    return VideoCard(
                      video: video,
                      data: videosdata,
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppDrawer extends GetWidget<HomeController> {
  const AppDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Get.back();
            },
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=900&q=60"),
            ),
            title: const Text("Fatma Maged ❤️",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                )),
            subtitle: const Text("Manage your zomorod account",
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.blue,
                    fontSize: 10)),
          ),
          const Spacer(),
          ListTile(
            onTap: () {
              Get.toNamed(Routes.PROFILE_SETTINGS);
            },
            leading: const Icon(
              Iconsax.user,
            ),
            title: const Text("Your channel",
                style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            onTap: () {
              Get.back();
            },
            leading: const Icon(
              Iconsax.user_add,
            ),
            title: const Text("Add account",
                style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            onTap: () {
              Get.to(const WatchTime());
            },
            leading: const Icon(
              Iconsax.chart4,
            ),
            title: const Text("Watch time",
                style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          const SizedBox(
            height: 8,
          ),
          ListTile(
            onTap: () {
              Get.back();
            },
            leading: const Icon(
              Iconsax.setting4,
            ),
            title: const Text("Settings",
                style: TextStyle(fontWeight: FontWeight.w400)),
          ),
          ListTile(
            onTap: () {
              Get.back();
            },
            leading: const Icon(
              Iconsax.moon,
            ),
            title: const Text("Dark Mode",
                style: TextStyle(fontWeight: FontWeight.w400)),
            trailing: Obx(
              () => SizedBox(
                width: 60,
                child: Switch(
                  value: controller.isDarkMode.value,
                  onChanged: (value) {
                    controller.isDarkMode.value = value;
                    ThemeService().switchTheme();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Spacer()
        ],
      ),
    );
  }
}
