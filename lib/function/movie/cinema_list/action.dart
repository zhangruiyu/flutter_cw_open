import 'package:fish_redux/fish_redux.dart';

import 'model/cinema_list_entity.dart';

enum CinemaListAction {
  Refresh,
  ResetData,
  SkipMovieDetailsPage,
  LoadMore,
  SetLoadMoreData
}

class CinemaListActionCreator {
  static Action onRefresh(p) {
    return Action(CinemaListAction.Refresh, payload: p);
  }

  static Action onResetData(p) {
    return Action(CinemaListAction.ResetData, payload: p);
  }

  static Action onSkipMovieDetailsPage(p) {
    return Action(CinemaListAction.SkipMovieDetailsPage, payload: p);
  }

  static Action onLoadMore(Map<String, dynamic> p) {
    return Action(CinemaListAction.LoadMore, payload: p);
  }

  static Action onSetLoadMoreData(CinemaListEntity movieScheduleEntity) {
    return Action(CinemaListAction.SetLoadMoreData,
        payload: movieScheduleEntity);
  }
}
