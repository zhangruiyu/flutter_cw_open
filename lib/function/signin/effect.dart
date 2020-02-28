import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'model/sign_in_result_entity.dart';
import 'model/sign_list_entity.dart';
import 'state.dart';

Effect<SignInState> buildEffect() {
  return combineEffects(<Object, Effect<SignInState>>{
    SignInAction.Sign: _onSign,
    Lifecycle.initState: _initState,
  });
}

Future _onSign(Action action, Context<SignInState> ctx) async {
  var result = await RequestClient.request<SignInResultEntity>(
      ctx.context, HttpConstants.Sign,
      showLoadingIndicator: true,
      queryParameters: {"signDate": DateUtils.toDay()});
  if (result.hasSuccess) {
    await showDialog(
        context: ctx.context,
        builder: (context) {
          return routes.buildPage(
              PageConstants.SignInResultDialog, {"pageData": result.data.data});
        });
    _initState(action, ctx);
  }
}

Future _initState(Action action, Context<SignInState> ctx) async {
  var result = await RequestClient.request<SignListEntity>(
      ctx.context, HttpConstants.SignList);
  if (result.hasSuccess) {
    ctx.dispatch(SignInActionCreator.onSetPageData(result.data.data));
  }
}
