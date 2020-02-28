import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

class ShareState implements Cloneable<ShareState> {
  Map<String, dynamic> args;
  Widget title;

  @override
  ShareState clone() {
    return ShareState()
      ..args = args
      ..title = title;
  }

  static String text = "text";
  static String h5 = "h5";
}

ShareState initState(Map<String, dynamic> args) {
  return ShareState()
    ..args = args
    ..title = args['title'];
}
