import 'package:flutter/material.dart';
import '../screens/video_detail_screen.dart';
import '../widgets/util.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../data/data.dart';

class HistoryCard extends StatelessWidget {
  final Video video;
  final Map data;

  const HistoryCard({Key? key, required this.video, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
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
              child: Image.network(
                data['thumbnails']['medium']['url'],
               // video.miniatureImagePath,
                height: 90.0,
                width: 170.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 4.0,
              right: 4.0,
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
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      child: Text(
                        data['title'],
                        //video.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 11.0),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        '${ data['channelTitle']
                        //video.channel.name
    } • '
                        '${formatNumber(video.viewsCounter)} • '
                        '${timeago.format(video.timestamp)}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontSize: 10.0),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(Icons.more_vert, size: 20.0),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
