import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/invite_entity.dart';
import 'state.dart';

Effect<InviteState> buildEffect() {
  return combineEffects(<Object, Effect<InviteState>>{
    InviteAction.Refresh: _onRefresh,
    InviteAction.Share: _onShare,
  });
}

Future _onRefresh(Action action, Context<InviteState> ctx) async {
  (await RequestClient.request<InviteEntity>(
          ctx.context, HttpConstants.inviteRecord))
      .yes((value) {
    ctx.dispatch(InviteActionCreator.onReSetData(value.data));
  });
  CompleterUtils.complete(action);
}

Future _onShare(Action action, Context<InviteState> ctx) async {
  showModalBottomSheet(
      context: ctx.context,
      builder: (BuildContext context) {
        return routes.buildPage(PageConstants.SharePage, {
          "type": ShareState.h5,
          "content": "我正在使用宠窝app,邀请您一起来省钱",
          "dec": "宠窝邀请您领取电影票肯德基,必胜客,家乐福,沃尔玛,饿了么等产品代金券",
          "url": ctx.state.data.inviteUrl,
        });
      });
}
