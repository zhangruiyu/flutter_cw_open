import 'dart:async';

import 'package:chongmeng/constants/constants.dart';
import 'package:fish_redux/fish_redux.dart';

class SplashState implements Cloneable<SplashState> {
  int n = isRelease ? 1 : 1;

  Timer timer;

  @override
  SplashState clone() {
    return SplashState()
      ..timer = timer
      ..n = n;
  }
}

SplashState initState(Map<String, dynamic> args) {
  return SplashState();
}
