import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    EditTextState state, Dispatch dispatch, ViewService viewService) {
  return new Scaffold(
    appBar: new Toolbar(actions: [
      new IconButton(
        icon: const Icon(Icons.send),
        tooltip: '完成',
        onPressed: () {
          Navigator.pop(viewService.context, state.textEditingController.text);
        },
      )
    ]),
    body: new Container(
        margin: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
        child: new TextFormField(
          autofocus: true,
          controller: state.textEditingController,
          decoration: new InputDecoration(
              border: const OutlineInputBorder(),
              labelText: state.title,
              labelStyle: TextStyle(fontSize: 20.0)),
          maxLines: state.maxLines,
          maxLength: state.maxLength,
        )),
  );
}
