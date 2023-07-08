import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../data/data.dart';
import '../data/colors.dart';

class CommentsSection extends StatelessWidget {
  const CommentsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainComponentsGrey,
      child:  Padding(
        padding: EdgeInsets.only(bottom: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CommentsSectionHeader(),
            LastComment(),
          ],
        ),
      ),
    );
  }
}

class CommentsSectionHeader extends StatelessWidget {
  const CommentsSectionHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 115,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Comments',
                  style: TextStyle(color: accentLightGrey, fontSize: 16),
                ),
                Text(
                  currentVideoComments.numberOfComments.toString(),
                  style: const TextStyle(color: textLightGrey, fontSize: 16),
                )
              ],
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Icon(
              CupertinoIcons.share_up,
              color: accentLightGrey,
              size: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class LastComment extends StatelessWidget {
  const LastComment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  currentVideoComments.topComment.avatarImagePath,
                ),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(100.0),
            ),
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                currentVideoComments.topComment.text,
                overflow: TextOverflow.clip,
                style: const TextStyle(
                  height: 1.75,
                  color: accentLightGrey,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
