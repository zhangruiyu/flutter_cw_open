import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<ReplyState> buildEffect() {
  return combineEffects(<Object, Effect<ReplyState>>{
    ReplyAction.SkipReviewImagePage: _onSkipReviewImagePage,
  });
}

void _onSkipReviewImagePage(Action action, Context<ReplyState> ctx) {
  Navigator.pushNamed(ctx.context, PageConstants.ReviewImagePage, arguments: {
    "images": <String>[action.payload],
    "index": 0
  });
}
