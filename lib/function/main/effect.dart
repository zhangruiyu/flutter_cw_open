import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/update/model/update_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MainState> buildEffect() {
  return combineEffects(<Object, Effect<MainState>>{
    Lifecycle.initState: _initState,
    MainAction.SkipSelectTalkTypePage: _onSkipSelectTalkTypePage,
  });
}

void _onSkipSelectTalkTypePage(Action action, Context<MainState> ctx) {
  UserHelper.loginCheck(ctx.context, () {
    Navigator.pushNamed(ctx.context, PageConstants.SelectTalkTypePage);
  });
}

Future _initState(Action action, Context<MainState> ctx) async {
  //加速一键登录预取号
  jverify.preLogin(timeOut: 10000);
  (await RequestClient.request<UpdateEntity>(ctx.context, HttpConstants.Update))
      .yes((value) {
//    value.data.needUpdate = true;
    //需要更新
    if (value.data.needUpdate) {
      showDialog(
          context: ctx.context,
          builder: (context) {
            return routes
                .buildPage(PageConstants.UpdatePage, {"data": value.data});
          });
    }
  });

//  NavigatorHelper.pusRecordPage(ctx.context);
}
