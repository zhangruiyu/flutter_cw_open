import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/function/share/state.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/network/entity/share_result_entity.dart';
import 'package:chongmeng/network/entity/share_url_entity.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:chongmeng/utils/share_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<MovieListState> buildEffect() {
  return combineEffects(<Object, Effect<MovieListState>>{
    MovieListAction.Refresh: _onRefresh,
  });
}

Future<void> _onRefresh(Action action, Context<MovieListState> ctx) async {
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "movieOnInfoList",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<HotMovieEntity>(
            ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          ...paramsData.data.params,
          if (GlobalStore.store.getState().ci != null)
            "ci": GlobalStore.store.getState().ci,
        }))
        .yes((value) {
      ctx.dispatch(MovieListActionCreator.onResetData(value));
    });
  });

  CompleterUtils.complete(action);
}
