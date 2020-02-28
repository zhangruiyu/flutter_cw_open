import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:chongmeng/function/movie/model/movie_params_entity.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/completer_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'model/cinema_list_entity.dart';
import 'state.dart';

Effect<CinemaListState> buildEffect() {
  return combineEffects(<Object, Effect<CinemaListState>>{
    CinemaListAction.Refresh: _onRefresh,
    CinemaListAction.LoadMore: _onLoadMore,
  });
}

Future<void> _onRefresh(Action action, Context<CinemaListState> ctx) async {
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "cinemaList",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<CinemaListEntity>(
            ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          "offset": 0,
          "limit": 20,
          ...paramsData.data.params,
          if (GlobalStore.store.getState().ci != null)
            "ci": GlobalStore.store.getState().ci,
        }))
        .yes((value) {
      ctx.dispatch(CinemaListActionCreator.onResetData(value));
    });
  });

  CompleterUtils.complete(action);
}

Future<void> _onLoadMore(Action action, Context<CinemaListState> ctx) async {
  (await RequestClient.request<MovieParamsEntity>(
          ctx.context, HttpConstants.movieParams,
          queryParameters: {
        'urlSuffix': "cinemaList",
        "ci": GlobalStore.store.getState().ci,
        "ciName": GlobalStore.store.getState().ciName,
      }))
      .yes((paramsData) async {
    (await RequestClient.request<CinemaListEntity>(
            ctx.context, paramsData.data.url,
            isPost: paramsData.data.isPost,
            header: paramsData.data.headers,
            queryParameters: {
          ...paramsData.data.params,
          "forceUpdate": new DateTime.now().millisecondsSinceEpoch,
          "offset": 20 * ctx.state.pageIndex,
          "limit": 20
        }))
        .yes((value) {
      ctx.state.easyRefreshController
          .finishLoad(success: true, noMore: !value.paging.hasMore);
      ctx.state.pageIndex++;
      ctx.dispatch(CinemaListActionCreator.onSetLoadMoreData(value));
    });
  });
  CompleterUtils.complete(action);
}
