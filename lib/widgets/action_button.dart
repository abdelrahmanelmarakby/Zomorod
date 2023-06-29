import 'package:flutter/material.dart';
import '../data/colors.dart';

class ActionButton extends StatelessWidget {
  final IconData actionIcon;
  final String bottomLabel;

  const ActionButton(
      {Key? key, this.actionIcon = Icons.close, this.bottomLabel = 'None'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: MediaQuery.of(context).orientation == Orientation.portrait
            ? 55
            : MediaQuery.of(context).size.height / 3.45,
        height: 70,
        padding: MediaQuery.of(context).orientation == Orientation.portrait
            ? const EdgeInsets.symmetric(vertical: 10.0)
            : const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              actionIcon,
              color: accentLightGrey,
              size: 20,
            ),
            Text(
              bottomLabel,
              style: const TextStyle(color: accentLightGrey, fontSize: 11),
            )
          ],
        ),
      ),
    );
  }
}
