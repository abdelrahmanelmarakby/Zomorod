import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/util.dart';

class Recommendation_screen extends StatelessWidget {
  const Recommendation_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              getVideos(index + 2, 'v3/search');
              final video = homeScreenVideos[index];
              return Recommendation_page(
                video: video,
                data: videosdata,
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10.0,
              );
            },
            itemCount: 20));
  }
}
