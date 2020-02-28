import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SelectSubTypeState> buildEffect() {
  return combineEffects(<Object, Effect<SelectSubTypeState>>{
    SelectSubTypeAction.SelectSubType: _onSelectSubType,
  });
}

void _onSelectSubType(Action action, Context<SelectSubTypeState> ctx) {
  Navigator.pop(ctx.context, action.payload);
}
