import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/pet_entity.dart';
import 'state.dart';

Effect<MyPetState> buildEffect() {
  return combineEffects(<Object, Effect<MyPetState>>{
    MyPetAction.Refresh: _onRefresh,
    MyPetAction.SkipAddPetPage: _onSkipAddPetPage,
  });
}

Future _onRefresh(Action action, Context<MyPetState> ctx) async {
  var result = await RequestClient.request<PetEntity>(
      ctx.context, HttpConstants.PetList);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(MyPetActionCreator.onResetData(result.data.data));
  }
}

Future _onSkipAddPetPage(Action action, Context<MyPetState> ctx) async {
  Navigator.pushNamed(ctx.context, PageConstants.PetAddPage);
}
