import 'dart:async';

import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'state.dart';

Effect<SplashState> buildEffect() {
  return combineEffects(<Object, Effect<SplashState>>{
    Lifecycle.initState: _initState,
    Lifecycle.dispose: _dispose,
    SplashAction.PushMainPage: _pushMainPage,
  });
}

void _pushMainPage(Action action, Context<SplashState> ctx) {
  Navigator.pushReplacementNamed(ctx.context, PageConstants.MainPage);
}

void _initState(Action action, Context<SplashState> ctx) {
  ctx.state.timer = new Timer.periodic(new Duration(seconds: 1), (Timer timer) {
    int n = ctx.state.n - 1;
    if (n == 0) {
      ctx.dispatch(LifecycleCreator.dispose());
      ctx.dispatch(SplashActionCreator.onPushMainPage());
    } else {
      ctx.dispatch(SplashActionCreator.onChangeTimeValue(n));
    }
  });
}

void _dispose(Action action, Context<SplashState> ctx) {
  if (ctx.state.timer != null) {
    ctx.state.timer.cancel();
    ctx.state.timer = null;
  }
}
