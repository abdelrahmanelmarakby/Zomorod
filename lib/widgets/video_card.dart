import 'package:flutter/material.dart';
import '../screens/video_detail_screen.dart';
import '../widgets/util.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../data/data.dart';

class VideoCard extends StatelessWidget {
  final Video video;
  final Map data;

  const VideoCard({Key? key, required this.video, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VideoDetailPage(),
              ),
            );
          },
          child: Stack(
            children: [
              Image.network(
                 data['thumbnails']['medium']['url'],
                //video.miniatureImagePath,
                height: 220.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  color: Colors.black,
                  child: Text(
                    video.duration,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => print('Navigate to profile'),
                child: CircleAvatar(
                  foregroundImage: NetworkImage(video.miniatureImagePath),
                ),
              ),
              const SizedBox(width: 8.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        data['title'],
                      // video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 15.0),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${
                         data['channelTitle']
                        //video.channel.name
    } • '
                        '${formatNumber(video.viewsCounter)} • '
                        '${timeago.format(video.timestamp)}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 14.0),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.more_vert, size: 20.0),
              ),
            ],
          ),
        )
      ],
    );
  }
}
