import 'package:chongmeng/components/dynamic/model/item_page_data.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/function/recipe/state.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'model/movie_details_entity.dart';
import 'model/movie_schedule_entity.dart';
import 'state.dart';

Effect<MovieDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<MovieDetailsState>>{
    MovieDetailsAction.Refresh: _onRefresh,
    MovieDetailsAction.RefreshSchedule: _onRefreshSchedule,
    MovieDetailsAction.LoadSchedule: _onLoadSchedule,
    Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<MovieDetailsState> ctx) {
  final TickerProvider tickerProvider = ctx.stfState as MovieDetailsPageState;
  ctx.state
    ..tabController =
        TabController(vsync: tickerProvider, length: 3, initialIndex: 0);
  ctx.state
    ..tabController.addListener(() {
      ctx.dispatch(MovieDetailsActionCreator.onRefreshSchedule({
        'itemPageData':
            ctx.state.pageData.values.toList()[ctx.state.tabController.index]
      }));
    });
  ctx.dispatch(MovieDetailsActionCreator.onRefresh(null));
  ctx.dispatch(MovieDetailsActionCreator.onRefreshSchedule(
      {'itemPageData': ctx.state.pageData.values.first}));
}

Future<void> _onRefresh(Action action, Context<MovieDetailsState> ctx) async {
  var itemMovie = ctx.state.itemMovie;
  (await RequestClient.request<MovieDetailsEntity>(
    ctx.context,
    HttpConstants.detailmovie,
    queryParameters: {
      'movieId': itemMovie.id.toString(),
      "ci": GlobalStore.store.getState().ci,
      "ciName": GlobalStore.store.getState().ciName,
    },
    isPost: true,
  ))
      .yes((value) {
    ctx.dispatch(
        MovieDetailsActionCreator.onSetDetailsData(value.data.detailMovie));
  });
  CompleterUtils.complete(action);
}

Future<void> _onRefreshSchedule(
    Action action, Context<MovieDetailsState> ctx) async {
  ItemMovieSchedulePageData itemPageData = action.payload['itemPageData'];
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "movie",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<MovieScheduleEntity>(
            ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          ...paramsData.data.params,
          "forceUpdate": new DateTime.now().millisecondsSinceEpoch,
          "movieId": ctx.state.itemMovie.id,
          "day": DateUtils.formatData(itemPageData.filtrateType),
          "offset": 0,
          "limit": 20
        }))
        .yes((value) {
      ctx.dispatch(
          MovieDetailsActionCreator.onSetScheduleData(itemPageData, value));
    });
  });

  CompleterUtils.complete(action);
}

Future<void> _onLoadSchedule(
    Action action, Context<MovieDetailsState> ctx) async {
  ItemMovieSchedulePageData itemPageData = action.payload['itemPageData'];
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "movie",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<MovieScheduleEntity>(
            ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          ...paramsData.data.params,
          "forceUpdate": new DateTime.now().millisecondsSinceEpoch,
          "movieId": ctx.state.itemMovie.id,
          "day": DateUtils.formatData(itemPageData.filtrateType),
          "offset": 20 * itemPageData.pageIndex,
          "limit": 20
        }))
        .yes((value) {
      itemPageData.easyRefreshController
          .finishLoad(success: true, noMore: !value.paging.hasMore);
      itemPageData.pageIndex++;
      ctx.dispatch(
          MovieDetailsActionCreator.onSetLoadScheduleData(itemPageData, value));
    });
  });
  CompleterUtils.complete(action);
}
