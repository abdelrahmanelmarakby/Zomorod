import 'package:flutter/material.dart';
import '../app/data/models/video_model.dart';
import '../data/colors.dart';
import '../widgets/action_buttons_bar.dart';
import '../widgets/comments_section.dart';
import '../widgets/subscription_bar.dart';
import '../widgets/util.dart';
import '../widgets/video_description.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({Key? key, required this.video}) : super(key: key);
  final VideoModel video;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgLightGrey,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              const VideoDescription(),
              ActionButtonsBar(),
              const HorizontalSeparator(height: 1),
              const SubscriptionBar(),
              const HorizontalSeparator(height: 1),
              const CommentsSection(),
              const HorizontalSeparator(height: 20),
              //const RecommendationsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
