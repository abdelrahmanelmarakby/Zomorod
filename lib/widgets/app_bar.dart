import 'package:flutter/material.dart';
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
      leading: const Padding(
          padding: EdgeInsets.only(left: 12.0),
          child: Center(
            child: Text(
              'ZOMOROD',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ) //Image.asset('assets/images/home_screen/logos/logo_dark.png'),
          ),
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications_outlined),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
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
