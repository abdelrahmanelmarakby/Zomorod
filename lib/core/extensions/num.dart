import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'dart:ui' as ui;

import 'Modareseen_utills.dart';

final screenSize = ui.window.physicalSize / ui.window.devicePixelRatio;
final screenWidth = screenSize.width;
final screenHeight = screenSize.height;

extension GetNumUtils on num {
  bool isLowerThan(num b) => ModareseenUtils.isLowerThan(this, b);

  bool isGreaterThan(num b) => ModareseenUtils.isGreaterThan(this, b);

  bool isEqual(num b) => ModareseenUtils.isEqual(this, b);

  /// Utility to delay some callback (or code execution).
  /// to stop it.
  ///
  /// Sample:
  /// ```
  /// void main() async {
  ///   print('+ wait for 2 seconds');
  ///   await 2.delay();
  ///   print('- 2 seconds completed');
  ///   print('+ callback in 1.2sec');
  ///   1.delay(() => print('- 1.2sec callback called'));
  ///   print('currently running callback 1.2sec');
  /// }
  ///```
  Future delay([FutureOr Function()? callback]) async => Future.delayed(
        Duration(milliseconds: (this * 1000).round()),
        callback,
      );
  Widget get heightSizedBox => SizedBox(
        height: toDouble(),
      );
  Widget percentHeightSizedBox(BuildContext context) => SizedBox(
        height: context.height * this,
      );
  Widget get widthSizedBox => SizedBox(
        width: toDouble(),
      );
  Widget percentWidthSizedBox(BuildContext context) => SizedBox(
        width: context.width * this,
      );

  double get w {
    return ((this / 390.0) * Get.context!.width) > this * 1.3
        ? this * 1.3
        : (this / 390.0) * Get.context!.width;
    // return (this / 390.0) * AppRouter.navigatorState.currentContext!.width;
  }

  double get getContextW {
    return ((this / 390.0)) * screenWidth;
  }

  double get h {
    return (this / 795.0) * Get.context!.height;
  }

  double get fixedHeight {
    return Get.context!.height > 1000
        ? toDouble()
        : (this / 795.0) * Get.context!.height;
  }

  double get fixedWidth {
    return Get.context!.width > 600
        ? toDouble()
        : (this / 390.0) * Get.context!.width;
    // return (this / 390.0) * AppRouter.navigatorState.currentContext!.width;
  }

  double get getContextH {
    return (this / 795.0) * screenHeight;
  }

  double get fontSize {
    return w > h ? h : w;
  }

  double get getContextFontSize {
    return getContextW;
  }

  double calculateVerticalPaddingForTextField(BuildContext context) {
    double verticalPadding = this / 2 - 11.h;

    verticalPadding = verticalPadding >= 0 ? verticalPadding : 0;
    return verticalPadding;
  }
}
