import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';

import 'action.dart';
import 'model/movie_order_entity.dart';
import 'model/seat_entity.dart';
import 'state.dart';

Effect<MovieSeatState> buildEffect() {
  return combineEffects(<Object, Effect<MovieSeatState>>{
    Lifecycle.initState: _initState,
    MovieSeatAction.Commit: _onCommit,
  });
}

Future<void> _initState(Action action, Context<MovieSeatState> ctx) async {
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "seatingPlan",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<SeatEntity>(ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          ...paramsData.data.params,
          'timestamp': new DateTime.now().millisecondsSinceEpoch,
          'seqNo': ctx.state.cinemaMovie.seqNo,
        }))
        .yes((value) {
      ctx.dispatch(MovieSeatActionCreator.onSetSeatData(value));
    });
  });
}

Future<void> _onCommit(Action action, Context<MovieSeatState> ctx) async {
  if (ctx.state.localSelectMovie.isNotEmpty) {
    UserHelper.loginCheck(ctx.context, () async {
      (await RequestClient.request<MovieOrderEntity>(
              ctx.context, HttpConstants.MovieOrderInfo,
              showLoadingIndicator: true,
              queryParameters: {
            "ci": GlobalStore.store.getState().ci,
            "ciName": GlobalStore.store.getState().ciName,
            'seqNo': ctx.state.cinemaMovie.seqNo,
            'count': ctx.state.localSelectMovie.length,
          }))
          .yes((value) {
        Navigator.pushNamed(ctx.context, PageConstants.MovieOrderPrePage,
            arguments: {
              'cinemaMovie': ctx.state.cinemaMovie,
              'order': value.data,
              'selectCinemaMovie': ctx.state.selectCinemaMovie,
              'seatEntity': ctx.state.seatEntity,
              'localSelectMovie': ctx.state.localSelectMovie,
              'cinemaMovies': ctx.state.cinemaMovies,
            });
//        ctx.dispatch(MovieSeatActionCreator.onSetSeatData(value));
      });
    });
  } else {
    showToast("请选择座位");
  }
}
