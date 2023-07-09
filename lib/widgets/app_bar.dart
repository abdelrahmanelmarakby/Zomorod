import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import '../app/data/api/firebase_video_service.dart';
import '../app/data/models/video_model.dart';
import '../app/routes/app_pages.dart';
import '../screens/user_profile_screen.dart';
import '../data/data.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 100.0,
      leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            child: const Center(
              child: Text(
                'ZOMOROD',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ) //Image.asset('assets/images/home_screen/logos/logo_dark.png'),
          ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () async {
            for (VideoModel video in videos) {
              BotToast.showLoading();
              VideoService.addVideo(video);
              BotToast.closeAllLoading();
            }
          },
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            print("clicked");

            BotToast.showLoading();
            videos.map((e) async => await VideoService.addVideo(e));
            BotToast.closeAllLoading();
            Get.toNamed(Routes.SEARCH);
          },
        ),
        IconButton(
          icon: CircleAvatar(
            foregroundImage: NetworkImage(currentUser.imageUrl),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserProfilePage(currentUser: currentUser),
              ),
            );
          },
        ),
      ],
    );
  }
}
