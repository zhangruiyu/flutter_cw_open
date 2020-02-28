import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/cinema_city_entity.dart';
import 'state.dart';

Effect<MovieCityState> buildEffect() {
  return combineEffects(<Object, Effect<MovieCityState>>{
    MovieCityAction.Refresh: _onRefresh,
    MovieCityAction.SelectCity: _onSelectCity,
    Lifecycle.initState: _initState,
  });
}

Future _onRefresh(Action action, Context<MovieCityState> ctx) async {
  (await RequestClient.request<CinemaCityEntity>(
          ctx.context, HttpConstants.movieCity))
      .yes((value) {
    ctx.dispatch(MovieCityActionCreator.onResetData(value.data));
  });
  CompleterUtils.complete(action);
}

Future _onSelectCity(Action action, Context<MovieCityState> ctx) async {
  Navigator.pop(ctx.context, action.payload);
}

void _initState(Action action, Context<MovieCityState> ctx) {
  Future(() async {
    if (await PermissionHelper.requestLocationPermission()) {
      final location = await AmapLocation.fetchLocation();
      ctx.dispatch(MovieCityActionCreator.onSetDistrictText({
        'district': await location.district,
        'location': location,
      }));
    } else {
      ctx.dispatch(MovieCityActionCreator.onSetDistrictText({
        'district': "定位失败",
        'location': null,
      }));
    }
  });
}
