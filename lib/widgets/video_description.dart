import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../widgets/util.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../data/data.dart';

class VideoDescription extends StatelessWidget {
  const VideoDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainComponentsGrey,
      child: Column(
        children: [
          VideoMiniature(),
          const VideoDetailsPanel(),
        ],
      ),
    );
  }
}

class VideoDetailsPanel extends StatelessWidget {
  const VideoDetailsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 8,
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 10.0, bottom: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentVideo.title,
                  style: const TextStyle(
                    color: accentLightGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 12),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: textLightGrey, fontSize: 13),
                    children: [
                      TextSpan(
                        text:
                            '${formatNumber(currentVideo.viewsCounter)} views • '
                            '${timeago.format(currentVideo.timestamp)} ',
                      ),
                      TextSpan(
                        text: currentVideo.tags.join(' '),
                        style: const TextStyle(
                            color: linkBlue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            onPressed: () {},
            child: const Icon(
              Icons.expand_more_outlined,
              color: accentLightGrey,
              size: 24,
            ),
          ),
        ),
      ],
    );
  }
}
