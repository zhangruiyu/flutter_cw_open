import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/network/entity/share_result_entity.dart';
import 'package:chongmeng/network/entity/share_url_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/share_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'action.dart';
import 'cinema_list/action.dart';
import 'cinema_search_delegate.dart';
import 'model/movie_params_entity.dart';
import 'movie_list/action.dart';
import 'state.dart';

Effect<MovieState> buildEffect() {
  return combineEffects(<Object, Effect<MovieState>>{
    MovieAction.Share: _onShare,
    MovieAction.SelectCity: _onSelectCity,
    MovieAction.ShowSearch: _onShowSearch,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<MovieState> ctx) {
  Future(() async {
    if (await PermissionHelper.requestLocationPermission()) {
      final location = await AmapLocation.fetchLocation();
      ctx.state.location = location;
      print("location ${await location.city}");
      print("location ${await location.district}");
      //如果是空,那么就展示位置就行啦
      if (GlobalStore.state.ci == null) {
        ctx.dispatch(
            MovieActionCreator.onSetDistrictText(await location.district));
      }
    } else {
      ctx.dispatch(MovieActionCreator.onSetDistrictText("定位失败"));
    }
  });
}

Future<void> _onSelectCity(Action action, Context<MovieState> ctx) async {
  var cityResult =
      (await Navigator.pushNamed(ctx.context, PageConstants.MovieCityPage));
  if (cityResult is String) {
    GlobalStore.state.ci = null;
    GlobalStore.state.ciName = null;
    ctx.dispatch(MovieActionCreator.onSetDistrictText(cityResult));
  } else if (cityResult is Map) {
    GlobalStore.state
      ..ci = cityResult['id']
      ..ciName = cityResult['name'];
    ctx.dispatch(MovieActionCreator.onSetDistrictText(cityResult['name']));
  }
  ctx.dispatch(MovieListActionCreator.onRefresh(null));
  ctx.dispatch(CinemaListActionCreator.onRefresh(null));
}

Future<void> _onShare(Action action, Context<MovieState> ctx) async {
  (await RequestClient.request<ShareUrlEntity>(
          ctx.context, HttpConstants.shareUrl,
          showLoadingIndicator: true))
      .yes((value) async {
    var result = await ShareUtils.share(
      ctx.context,
      ShareState.h5,
      content: "他来啦,他来啦,他正在使用宠窝app打折购买电影票",
      dec: "我已成功购买打折电影票,特邀请您来一起省钱",
      url: value.data.inviteUrl,
      title: Padding(
        child: Text(
          "分享即可得萌币,邀请成功更可获得大额萌币",
          style: TextStyle(fontSize: 18),
        ),
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
      ),
    );
    if (ShareUtils.isShareSuccess(result)) {
      (await RequestClient.request<ShareResultEntity>(
              ctx.context, HttpConstants.shareAward,
              queryParameters: {'shareType': 'MovieShare'},
              showLoadingIndicator: true))
          .yes((value) async {
        showToast("恭喜您,获得${value.data.value}萌币",
            duration: Duration(
              milliseconds: 3300,
            ));
      });
    }
  });
}

Future<void> _onShowSearch(Action action, Context<MovieState> ctx) async {
  if (GlobalStore.store.getState().ci == null) {
    ctx.dispatch(MovieActionCreator.onSelectCity());
  } else {
    (await RequestClient.request<MovieParamsEntity>(
            ctx.context, HttpConstants.movieParams,
            queryParameters: {
          'urlSuffix': "search",
          "ci": GlobalStore.store.getState().ci,
          "ciName": GlobalStore.store.getState().ciName,
        }))
        .yes((paramsData) async {
      var params = paramsData.data;
      showSearch(context: ctx.context, delegate: CinemaSearchDelegate(params));
    });
  }
}
