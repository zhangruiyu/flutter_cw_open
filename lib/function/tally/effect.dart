import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'entity/current_user_tally_entity.dart';
import 'entity/tally_tag_entity.dart';
import 'state.dart';

Effect<TallyState> buildEffect() {
  return combineEffects(<Object, Effect<TallyState>>{
    TallyAction.SkipAddTallyPage: _onSkipAddTallyPage,
    TallyAction.Refresh: _onRefresh,
  });
}

Future _onSkipAddTallyPage(Action action, Context<TallyState> ctx) async {
  var result = await RequestClient.request<TallyTagEntity>(
      ctx.context, HttpConstants.TallyTags,
      showLoadingIndicator: true);
  if (result.hasSuccess) {
    await Navigator.pushNamed(ctx.context, PageConstants.AddTallyPage,
        arguments: {'tags': result.data.data});
    ctx.dispatch(TallyActionCreator.onRefresh(null));
  }
}

Future _onRefresh(Action action, Context<TallyState> ctx) async {
  var result = await RequestClient.request<CurrentUserTallyEntity>(
      ctx.context, HttpConstants.CurrentAllTally);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(TallyActionCreator.onAddPageListData({
      'data': result.data.data,
    }));
  }
}
