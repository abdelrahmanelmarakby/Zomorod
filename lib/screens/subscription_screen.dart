import 'package:flutter/material.dart';
import '../data/data.dart';
import '../widgets/app_bar.dart';
import '../data/colors.dart';
import '../widgets/util.dart';
import 'all_subscription_screen.dart';
import 'recommendation_screen.dart';
import '../core/resourses/color_manger.dart';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: bgLightGrey,
      appBar: const CustomAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: SizedBox(
                height: 90.0,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final video = homeScreenVideos[index];

                          getVideos(index, 'v3/search');
                          return buildSubsList(video, videosdata);
                        },
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 4.0,
                            ),
                        itemCount: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: MaterialButton(
                        height: 80.0,
                        minWidth: 40.0,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const All_subscription()));
                        },
                        color: ColorsManager.primary,
                        child: const Text('All'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 1.0,
            ),
            const Recommendation_screen(),
            //RecommendationsSection(),
          ],
        ),
      ),
    );
  }
}

Widget buildSubsList(Video video, Map data) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          CircleAvatar(
            radius: 30.0,
            backgroundImage: NetworkImage(
                //data['thumbnails']['medium']['url']
                video.miniatureImagePath),
          ),
        ],
      ),
      const SizedBox(
        height: 5.0,
      ),
      const SizedBox(
        width: 70.0,
        child: Text(
          'Mariam Hussien',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
              color: suvaGrey, fontWeight: FontWeight.bold, fontSize: 12.0),
        ),
      )
    ],
  );
}
