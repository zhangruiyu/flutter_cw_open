import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart' hide Action;

class WindowUtils {
  static double getScreenWidth() {
    return window.physicalSize.width / window.devicePixelRatio;
  }

  static double getScreenHeight() {
    return window.physicalSize.height / window.devicePixelRatio;
  }

  static bool isIPhoneX(BuildContext context) {
    if (Platform.isIOS) {
      var size = MediaQuery.of(context).size;
      if (size.height == 812.0 || size.width == 812.0) {
        return true;
      }
    }
    return false;
  }
}
