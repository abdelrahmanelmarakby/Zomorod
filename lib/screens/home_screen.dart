import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/app_bar.dart';
import '../widgets/video_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SafeArea(
        child: CustomScrollView(
          primary: false,
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 60.0),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final video = homeScreenVideos[index];
                    return VideoCard(video: video);
                  },
                  childCount: homeScreenVideos.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}