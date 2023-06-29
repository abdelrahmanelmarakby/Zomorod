import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../data/data.dart';
import '../screens/video_detail_screen.dart';

String formatNumber(int value) {
  const units = <int, String>{
    1000000000: 'B',
    1000000: 'M',
    1000: 'K',
  };
  return units.entries
      .map((e) => '${value ~/ e.key}${e.value}')
      .firstWhere((e) => !e.startsWith('0'), orElse: () => '$value');
}

class HorizontalSeparator extends StatelessWidget {
  final double height;

  const HorizontalSeparator({Key key, this.height = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
class VideoMiniature extends StatelessWidget {

  VideoMiniature({Key key}) : super(key: key);

  final FlickManager flickManager= FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      child: FlickVideoPlayer(


        flickManager: flickManager,
        wakelockEnabled: true,


      ),
    );
  }
}

class Videorec extends StatelessWidget {
  final String path;

  Videorec({Key key, this.path = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 3.5,

      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      ),
      /*child: FlickVideoPlayer(
        flickManager: flickManager,
        wakelockEnabled: true,
      ),*/
    );
  }
}

class History_page extends StatelessWidget {
  final Video video;

  const History_page({Key key, @required this.video}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
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
              child: Image.network(
                video.miniatureImagePath,
                height: 110.0,
                width: 190.0,
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
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 15,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              .copyWith(fontSize: 11.0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${video.channel.name} • '
                              '${formatNumber(video.viewsCounter)} • '
                              '${timeago.format(video.timestamp)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              .copyWith(fontSize: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.0,),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.more_vert, size: 20.0),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

class Download_page extends StatelessWidget {
  final Video video;

  const Download_page({Key key, @required this.video}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
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
              child: Image.network(
                video.miniatureImagePath,
                height: 110.0,
                width: 190.0,
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
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        SizedBox(width: 15,),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Flexible(
                        child: Text(
                          video.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              .copyWith(fontSize: 11.0),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${video.channel.name} • '
                              '${formatNumber(video.viewsCounter)} • '
                              '${timeago.format(video.timestamp)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              .copyWith(fontSize: 10.0),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 5.0,),
                GestureDetector(
                  onTap: () {},
                  child: Icon(Icons.more_vert, size: 20.0),
                ),
              ],
            ),
          ),
        ),

      ],
    );
  }
}

