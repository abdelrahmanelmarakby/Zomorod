import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zomorod/widgets/video_card.dart';
import '../core/services/network_service.dart/dio_helper.dart';
import '../data/data.dart';
import '../screens/video_detail_screen.dart';
import 'app_bar.dart';


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

  const HorizontalSeparator({Key? key, this.height = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class VideoMiniature extends StatelessWidget {
  VideoMiniature({Key? key}) : super(key: key);

  final FlickManager flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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

class VideoShow extends StatefulWidget {
  final String id;
  const VideoShow({Key? key, required this.id}) : super(key: key);

  @override
  State<VideoShow> createState() => _VideoShowState();
}

class _VideoShowState extends State<VideoShow> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId: widget.id,
        flags: const YoutubePlayerFlags(
          showLiveFullscreenButton: true,
          autoPlay: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(controller: _controller),
          builder: (context, player) {
            return YoutubePlayer(controller: _controller);
          }),
    );
  }
}

class Videorec extends StatelessWidget {
  final String path;

  const Videorec({Key? key, this.path = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(path), fit: BoxFit.fill),
      ),
      /*child: FlickVideoPlayer(
        flickManager: flickManager,
        wakelockEnabled: true,
      ),*/
    );
  }
}

class Videoex extends StatelessWidget {
  final String path;

  const Videoex({Key? key, this.path = '/'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).orientation == Orientation.portrait
          ? MediaQuery.of(context).size.width
          : MediaQuery.of(context).size.width / 3.5,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Text(
        path,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),

      /*decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(path), fit: BoxFit.fill),
      ),*/
    );
  }
}

class History_page extends StatelessWidget {
  final Video video;
  final Map data;

  const History_page({Key? key, required this.video, required this.data})
      : super(key: key);

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
                data['thumbnails']['medium']['url'],
                //video.miniatureImagePath,
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
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
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
                          '${timeago.format(

                              video.timestamp)}',
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
                const SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.more_vert, size: 20.0),
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
  final Map data;
  const Download_page({Key? key, required this.video, required this.data})
      : super(key: key);

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
                data['thumbnails']['medium']['url'],
                //video.miniatureImagePath,
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
                      ?.copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          width: 15,
        ),
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
                          data['title'],
                         // video.title,
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
                          '${
                           data['channelTitle']
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
                const SizedBox(
                  width: 5.0,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const Icon(Icons.more_vert, size: 20.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Recommendation_page extends StatelessWidget {
  final Video video;
  final Map data;
  const Recommendation_page({Key? key, required this.video, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      width: double.infinity,
      child: Column(
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
                   data['thumbnails']['medium']['url'],
                 // video.miniatureImagePath,
                  height: 250.0,
                  width: double.infinity,
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
          const SizedBox(height: 7.0),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(video.miniatureImagePath),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
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
                                ?.copyWith(fontSize: 14.0),
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
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontSize: 12.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Icons.more_vert, size: 20.0),
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

class SubsScreen extends StatelessWidget {
  const SubsScreen({Key? key}) : super(key: key);

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
                    getVideos(index + 5, 'v3/search');
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

class YourVideo extends StatelessWidget {
  const YourVideo({Key? key}) : super(key: key);

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
                    getVideos(index + 1, 'v3/search');
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

class WatchLater_screen extends StatelessWidget {
  const WatchLater_screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: ListView.separated(
              scrollDirection: Axis.vertical,
              primary: false,
              itemBuilder: (context, index) {
                getVideos(index + 4, 'v3/search');
                final video = homeScreenVideos[index];
                return Download_page(
                  video: video,
                  data: videosdata,
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                    height: 15.0,
                  ),
              itemCount: 20),
        ),
      ),
    );
  }
}

Map videosdata = {};
String videId = '';
String videoTitle = '';

void getVideos(int index, String url) {
  DioHelper.getData(url: url, query: {
    'part': 'snippet',
    'maxResults': '150',
    'q': 'engineering',
    'key': 'AIzaSyBsWoSQsneWCo5OlOgr7TDVWrZqlP8_eBc',
  }).then((value) {
    videosdata = value.data['items'][index]['snippet'];
    videId = value.data['items'][index]['id']['videoId'];
    videoTitle = value.data['items'][index]['snippet']['title'];
  }).catchError((error) {
    print("error is : $error");
  });
}
