import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:zomorod/app/modules/profile_settings/views/pages/watch_time_stats.dart';
import 'package:zomorod/app/routes/app_pages.dart';
import '../app/modules/home/controllers/home_controller.dart';
import '../core/services/theme.dart';
import '../data/colors.dart';
import '../data/data.dart';
import 'package:get/get.dart';

class UserProfilePage extends StatelessWidget {
  final Channel currentUser;

  const UserProfilePage({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.close, color: Colors.white)),
        title: const Text(
          'Account',
        ),
      ),
      body: SafeArea(
        child: Container(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    CircleAvatar(
                        backgroundImage: AssetImage(currentUser.logoImagePath),
                        radius: 30),
                    const SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(currentUser.name,
                            style: const TextStyle(fontSize: 16.0)),
                        const SizedBox(height: 5.0),
                        const Text('Fatma.M.Elessawy@gmail.com',
                            style: TextStyle(fontSize: 16.0)),
                        const SizedBox(height: 5.0),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.PROFILE_SETTINGS);
                          },
                          child: const Text('Manage your Zomrod Account',
                              style: TextStyle(color: linkBlue)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Divider(),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PROFILE_SETTINGS);
                },
                child: const ListTile(
                  leading: Icon(Icons.account_box, color: suvaGrey),
                  title: Text(
                    'Your channel',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.settings_applications, color: suvaGrey),
                title: Text(
                  'zomorod Studio',
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const WatchTime());
                },
                child: const ListTile(
                  leading: Icon(Icons.access_time, color: suvaGrey),
                  title: Text(
                    'Time watched',
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.video_library, color: suvaGrey),
                title: Text(
                  'Get zomorod Premium',
                ),
              ),
              const ListTile(
                leading: Icon(Icons.monetization_on, color: suvaGrey),
                title: Text(
                  'Paid memberships',
                ),
              ),
              const ListTile(
                leading: Icon(Icons.supervisor_account, color: suvaGrey),
                title: Text(
                  'Switch account',
                ),
              ),
              const ListTile(
                leading: Icon(Icons.security, color: suvaGrey),
                title: Text(
                  'Your data in zomorod',
                ),
              ),
              const Divider(),
              const ListTile(
                leading: Icon(Icons.settings, color: suvaGrey),
                title: Text(
                  'Settings',
                ),
              ),
              const ListTile(
                leading: Icon(Icons.help, color: suvaGrey),
                title: Text(
                  'Help & feedback',
                ),
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
                      value: Get.find<HomeController>().isDarkMode.value,
                      onChanged: (value) {
                        Get.find<HomeController>().isDarkMode.value = value;
                        ThemeService().switchTheme();
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
