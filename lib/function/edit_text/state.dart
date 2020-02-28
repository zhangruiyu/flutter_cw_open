import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class EditTextState implements Cloneable<EditTextState> {
  TextEditingController textEditingController;
  int maxLines;
  int maxLength;
  String title;

  @override
  EditTextState clone() {
    return EditTextState()
      ..textEditingController = textEditingController
      ..title = title
      ..maxLength = maxLength
      ..maxLines = maxLines;
  }
}

EditTextState initState(Map<String, dynamic> args) {
  return EditTextState()
    ..textEditingController = TextEditingController(text: args['initText'])
    ..title = args['title']
    ..maxLength = args['maxLength']
    ..maxLines = args['maxLines'];
}
