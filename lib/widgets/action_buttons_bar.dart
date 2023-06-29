import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:zomorod/widgets/util.dart';
import '../data/colors.dart';
import '../data/data.dart';
import 'action_button.dart';

class ActionButtonsBar extends StatelessWidget {
  final actionButtons = [
    ActionButton(
      actionIcon: Icons.thumb_up_alt_outlined,
      bottomLabel: formatNumber(currentVideo.likesCounter),
    ),
    ActionButton(
        actionIcon: Icons.thumb_down_alt_outlined,
        bottomLabel: formatNumber(currentVideo.dislikesCounter)),
    const ActionButton(
      actionIcon: CupertinoIcons.reply_all,
      bottomLabel: 'Share',
    ),
    const ActionButton(
      actionIcon: Icons.download_outlined,
      bottomLabel: 'Download',
    ),
    const ActionButton(
      actionIcon: Icons.save_alt_outlined,
      bottomLabel: 'Save',
    ),
  ];

  ActionButtonsBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: mainComponentsGrey,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: actionButtons,
        ),
      ),
    );
  }
}
