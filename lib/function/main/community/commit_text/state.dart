import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

class CommitTextState implements Cloneable<CommitTextState> {
  TextEditingController contentTextEditingController;

  @override
  CommitTextState clone() {
    return CommitTextState()
      ..contentTextEditingController = contentTextEditingController;
  }
}

CommitTextState initState(Map<String, dynamic> args) {
  return CommitTextState()
    ..contentTextEditingController = TextEditingController();
}
