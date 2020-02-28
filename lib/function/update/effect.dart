import 'dart:io';

import 'package:chongmeng/function/update/view.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:url_launcher/url_launcher.dart';
import 'action.dart';
import 'model/update_entity.dart';
import 'state.dart';

Effect<UpdateState> buildEffect() {
  return combineEffects(<Object, Effect<UpdateState>>{
    UpdateAction.StartDown: _onStartDown,
    Lifecycle.dispose: _dispose,
  });
}

void _onStartDown(Action action, Context<UpdateState> ctx) {
  if (Platform.isIOS) {
    launch(ctx.state.data.downLoadUrl);
  } else {
    if (ctx.state.downloadSubscription == null) {
      UpdateData updateData = ctx.state.data;
      ctx.state.downloadSubscription = updateStream
          .receiveBroadcastStream(updateData.downLoadUrl)
          .listen((data) {
        int progress = data["percent"];
        var done = data["done"];
        if (done) {
          _stopDownload(ctx);
        } else {
          if (progress != null) {
            ctx.dispatch(UpdateActionCreator.onUpdateProgress(progress));
          }
        }
      });
    }
  }
}

void _dispose(Action action, Context<UpdateState> ctx) {
  _stopDownload(ctx);
}

// 停止监听进度
void _stopDownload(Context<UpdateState> ctx) {
  if (ctx.state.downloadSubscription != null) {
    ctx.state.downloadSubscription.cancel();
    ctx.state.downloadSubscription = null;
    ctx.state.percent = 0;
  }
}
