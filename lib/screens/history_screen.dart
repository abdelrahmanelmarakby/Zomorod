import 'package:flutter/material.dart';
import 'package:zomorod/widgets/app_bar.dart';
import 'package:zomorod/widgets/util.dart';
import '../data/data.dart';

class History extends StatelessWidget {
  final Video? video;
  const History({Key? key, required this.video}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: buildHistoryScreen(),
    );
  }

  Widget buildHistoryScreen() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            primary: false,
            itemBuilder: (context, index) {
              final video = homeScreenVideos[index];
              return History_page(video: video);
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ),
            itemCount: 8),
      ),
    );
  }
}
