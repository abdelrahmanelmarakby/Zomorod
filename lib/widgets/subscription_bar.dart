import 'package:flutter/material.dart';
import '../data/colors.dart';
import '../data/data.dart';
import '../widgets/util.dart';


class SubscriptionBar extends StatelessWidget {
  const SubscriptionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainComponentsGrey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const <Widget>[ChannelInformation(), SubscriptionStatus()],
      ),
    );
  }
}

class ChannelInformation extends StatelessWidget {

  const ChannelInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(currentVideoDetailChannel.logoImagePath),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentVideoDetailChannel.name,
                  style: const TextStyle(
                      color: accentLightGrey,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  '${formatNumber(currentVideoDetailChannel.subscribersCounter)}'
                      ' subscribers',
                  style: const TextStyle(color: textLightGrey, fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionStatus extends StatelessWidget {
  const SubscriptionStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Text(
                'Subscribed'.toUpperCase(),
                style: const TextStyle(color: accentLightGrey, fontSize: 16),
              ),
            ),
            const Icon(
              Icons.notifications_outlined,
              color: textLightGrey,
              size: 32,
            ),
          ],
        ),
      ),
    );
  }
}