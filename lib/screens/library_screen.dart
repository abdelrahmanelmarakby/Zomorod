import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zomorod/screens/downloads_screen.dart';
import 'package:zomorod/screens/history_screen.dart';
import 'package:zomorod/screens/video_detail_screen.dart';
import '../data/colors.dart';
import '../data/data.dart';
import '../widgets/app_bar.dart';
import '../widgets/history_card.dart';

import '../widgets/video_card.dart';


class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: build_library(context),
    );
  }
  Widget build_library(BuildContext context){
    return SingleChildScrollView(
      primary: false,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.history, color: suvaGrey),
            title: Text(
              'History',
              style: TextStyle(color: Colors.white),
            ),
            trailing: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  History()
                      )
                  ) ;
                },
                child: Text('Show All',style:
                TextStyle(
                    color: linkBlue),)),
          ),
          Container(
            height: 150.0,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
                primary: false,
                itemBuilder: (context, index){
                  final video = homeScreenVideos[index];
                  return Container(
                      height: 90.0,
                      width: 170.0,
                      child: HistoryCard(video: video));
                },
                separatorBuilder: (context, index) => SizedBox(width: 5.0,),
                itemCount: 10),
          ),
          Divider(
            thickness: 0.1,
             // height:0.5 ,
              color: Colors.white),
          ListTile(
            leading: Icon(Icons.video_library, color: suvaGrey),
            title:
            Text('Your videos', style: TextStyle(color: Colors.white)),
          ),
          GestureDetector(
            onTap: (){
              Navigator.push(
                 context,
                 MaterialPageRoute(
                    builder: (context) => const DownloadsScreen(),),
              );
              },
            child: ListTile(
              leading: Icon(Icons.file_download, color: suvaGrey),
              title: Text('Downloads', style: TextStyle(color: Colors.white)),
              subtitle: Text('2 recommendations',
                  style: TextStyle(color: suvaGrey, fontSize: 12.0)),
            ),
          ),
          Divider(
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
                        style:
                        TextStyle(color: Colors.white, fontSize: 16.0)),
                    Icon(Icons.arrow_drop_down, color: Colors.white)
                  ],
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add, color: linkBlue),
            title: Text('New Playlist', style: TextStyle(color: linkBlue)),
          ),
          ListTile(
            leading: Icon(Icons.watch_later, color: suvaGrey),
            title:
            Text('Watch later', style: TextStyle(color: Colors.white)),
            subtitle: Text('Videos you save for later',
                style: TextStyle(color: suvaGrey, fontSize: 12.0)),
          ),
        ],
      ),
    );
  }


}