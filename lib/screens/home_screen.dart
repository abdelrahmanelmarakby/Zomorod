import 'package:flutter/material.dart';
import 'package:zomorod/widgets/util.dart';
import '../data/data.dart';
import '../widgets/app_bar.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  Map ourData = {};

  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
