import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../widgets/util.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../data/data.dart';
import '../screens/video_detail_screen.dart';

class VideoRecommendation extends StatelessWidget {
  final Video videoData;

  const VideoRecommendation(this.videoData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VideoDetailPage(),
                ),
              );
            },
            child: Videorec(path: videoData.miniatureImagePath)),
        Container(
          height: 70,
          color: mainComponentsGrey,
          child: Row(
            children: [
              VideoRecommendationDescription(videoData),
              Expanded(
                flex: 1,
                child: TextButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.more_vert_rounded,
                    color: accentLightGrey,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VideoRecommendationDescription extends StatelessWidget {
  final Video videoData;

  const VideoRecommendationDescription(this.videoData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(videoData.channel.logoImagePath),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      videoData.title,
                      style: const TextStyle(
                        color: accentLightGrey,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    '${videoData.channel.name} • '
                    '${formatNumber(videoData.viewsCounter)} views • '
                    '${timeago.format(videoData.timestamp)}',
                    style: const TextStyle(color: textLightGrey, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
