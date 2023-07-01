//import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
//import 'package:video_player/video_player.dart';

import '../widgets/app_bar.dart';

class All_subscription extends StatelessWidget {
  const All_subscription({super.key});

  @override

  //final FlickManager flickManager= FlickManager(
     // videoPlayerController: VideoPlayerController.network(
       //   'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'));
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(

        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 10.0,top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.keyboard_arrow_down_outlined,color: Colors.white70,),
                  Text('most related',style:TextStyle(
                    fontSize: 12.0,
                    color: Colors.white70,
                  )),
                ],
              ),
            ),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),
            buildsubscripedchannelCard(),



          ],
        ),
      )

    );
  }
  Widget buildsubscripedchannelCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: GestureDetector(
        onTap: (){

        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
                Icons.notifications_active_rounded,),
            Row(
              children: <Widget>[
                Text('Caaaaaats TVvvvvv',
                    style:
                    TextStyle(color: Colors.white, fontSize: 16.0)),
                SizedBox(width: 15.0,),
                CircleAvatar(
                  radius: 17.0,
                  backgroundImage: AssetImage(
                      'assets/images/profile_screen/avatars/profile.png'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
