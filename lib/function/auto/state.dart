import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class AutoState implements Cloneable<AutoState> {
  var telTextEditingController = TextEditingController();
  var autoCodeTextEditingController = TextEditingController();
  var autoCodeFocusNode = new FocusNode();
  var isCheckOK;

  @override
  AutoState clone() {
    return AutoState()
      ..telTextEditingController = telTextEditingController
      ..autoCodeTextEditingController = autoCodeTextEditingController
      ..autoCodeFocusNode = autoCodeFocusNode
      ..isCheckOK = isCheckOK;
  }
}

AutoState initState(Map<String, dynamic> args) {
  return AutoState()
    ..telTextEditingController = TextEditingController()
    ..autoCodeTextEditingController = TextEditingController()
    ..autoCodeFocusNode = new FocusNode()
    ..isCheckOK = false;
}
