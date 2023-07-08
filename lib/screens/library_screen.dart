import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomorod/screens/downloads_screen.dart';
import 'package:zomorod/screens/history_screen.dart';
import 'package:zomorod/widgets/util.dart';
import '../data/colors.dart';
import '../data/data.dart';
import '../widgets/app_bar.dart';
import '../widgets/history_card.dart';

class LibraryTab extends StatelessWidget {
  const LibraryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: build_library(context),
    );
  }

  Widget build_library(BuildContext context) {
    return SingleChildScrollView(
      primary: false,
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.history, color: suvaGrey),
            title: const Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
            trailing: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const History()));
                },
                child: const Text(
                  'Show All',
                  style: TextStyle(color: linkBlue),
                )),
          ),
          SizedBox(
            height: 150.0,
            width: double.infinity,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                primary: false,
                itemBuilder: (context, index) {
                  final video = homeScreenVideos[index];
                  getVideos(index, 'v3/search');
                  return SizedBox(
                      height: 90.0,
                      width: 170.0,
                      child: HistoryCard(
                        video: video,
                        data: videosdata,
                      ));
                },
                separatorBuilder: (context, index) => const SizedBox(
                      width: 5.0,
                    ),
                itemCount: 10),
          ),
          const Divider(
              thickness: 0.1,
              // height:0.5 ,
              color: Colors.white),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => YourVideo()));
            },
            child: const ListTile(
              leading: Icon(Icons.video_library, color: suvaGrey),
              title: Text('Your videos', style: TextStyle(color: Colors.white)),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DownloadsScreen(),
                ),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.file_download, color: suvaGrey),
              title: Text('Downloads', style: TextStyle(color: Colors.white)),
              subtitle: Text('2 recommendations',
                  style: TextStyle(color: suvaGrey, fontSize: 12.0)),
            ),
          ),
          const Divider(
              thickness: 0.1,
              // height:0.5 ,
              color: Colors.white),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Playlists',
                    style: TextStyle(color: Colors.white, fontSize: 16.0)),
                Row(
                  children: <Widget>[
                    Text('Recently added',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                )
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.add, color: linkBlue),
            title: Text('New Playlist', style: TextStyle(color: linkBlue)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const WatchLater_screen()),
              );
            },
            child: const ListTile(
              leading: Icon(Icons.watch_later, color: suvaGrey),
              title: Text('Watch later', style: TextStyle(color: Colors.white)),
              subtitle: Text('Videos you save for later',
                  style: TextStyle(color: suvaGrey, fontSize: 12.0)),
            ),
          ),
        ],
      ),
    );
  }
}
