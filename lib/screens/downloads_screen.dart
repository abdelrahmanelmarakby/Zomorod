import 'package:flutter/material.dart';
import 'package:zomorod/widgets/app_bar.dart';

import '../data/data.dart';
import '../widgets/util.dart';

class DownloadsScreen extends StatelessWidget {
  const DownloadsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CustomAppBar(),
      body: buildDownloadScreen(),
    );
  }



  Widget buildDownloadScreen() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10)),
        child: ListView.separated(
            scrollDirection: Axis.vertical,
            primary: false,
            itemBuilder: (context, index){
              final video = homeScreenVideos[index];
              return Download_page(video: video);
            },
            separatorBuilder: (context, index) => SizedBox(height: 15.0,),
            itemCount: 8),
      ),
    );
  }
}
