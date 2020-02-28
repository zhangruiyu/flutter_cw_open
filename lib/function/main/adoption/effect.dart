import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:city_pickers/city_pickers.dart' as city;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/adoption_entity.dart';
import 'state.dart';

Effect<AdoptionState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionState>>{
    AdoptionAction.Refresh: _onRefresh,
    AdoptionAction.SkipDetailsPage: _onSkipDetailsPage,
  });
}

Future _onRefresh(Action action, Context<AdoptionState> ctx) async {
  var result = await RequestClient.request<AdoptionEntity>(
      ctx.context, HttpConstants.AdoptionList);
  CompleterUtils.complete(action);
  if (result.hasSuccess) {
    ctx.dispatch(AdoptionActionCreator.onResetData(result.data.data));
  }
}

Future _onSkipDetailsPage(Action action, Context<AdoptionState> ctx) async {
  Navigator.pushNamed(ctx.context, PageConstants.AdoptionDetailsPage,
      arguments: {'data': action.payload});
//  city.Result result =
//      await city.CityPickers.showCityPicker(context: ctx.context);
}
