import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

class BindTelState implements Cloneable<BindTelState> {
  var telTextEditingController = TextEditingController();
  var autoCodeTextEditingController = TextEditingController();
  var autoCodeFocusNode = new FocusNode();
  var isCheckOK;
  Map<String, dynamic> queryParameters;

  @override
  BindTelState clone() {
    return BindTelState()
      ..telTextEditingController = telTextEditingController
      ..autoCodeTextEditingController = autoCodeTextEditingController
      ..autoCodeFocusNode = autoCodeFocusNode
      ..queryParameters = queryParameters
      ..isCheckOK = isCheckOK;
  }
}

BindTelState initState(Map<String, dynamic> args) {
  return BindTelState()
    ..telTextEditingController = TextEditingController()
    ..autoCodeTextEditingController = TextEditingController()
    ..autoCodeFocusNode = new FocusNode()
    ..isCheckOK = false
    ..queryParameters = args['queryParameters'];
}
