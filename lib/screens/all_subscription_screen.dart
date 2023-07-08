import 'package:flutter/material.dart';
import 'package:zomorod/data/data.dart';
import 'package:zomorod/screens/subscriber_page.dart';
import 'package:zomorod/widgets/util.dart';
import '../widgets/app_bar.dart';

class All_subscription extends StatelessWidget {
  const All_subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          children: [
             Padding(
              padding: EdgeInsets.only(right: 10.0, top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: Colors.white70,
                  ),
                  Text('most related',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.white70,
                      )),
                ],
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    primary: false,
                    itemBuilder: (context, index) {
                      final video = homeScreenVideos[index];
                      getVideos(index + 2, 'v3/search');
                      return buildsubscripedchannelCard(
                          video, context, videosdata);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10.0,
                      );
                    },
                    itemCount: 20),
              ),
            )),
          ],
        ));
  }

  Widget buildsubscripedchannelCard(
      Video video, BuildContext context, Map data) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Subscriber_page(),
          ),
        );
      },
      child: SizedBox(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Icon(
              Icons.notifications_active_rounded,
            ),
            Row(
              children: <Widget>[
                Text(
                    data['channelTitle'],
                    //video.channel.name,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 16.0)),
                const SizedBox(
                  width: 15.0,
                ),
                CircleAvatar(
                  radius: 17.0,
                  backgroundImage: NetworkImage(video.miniatureImagePath),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
