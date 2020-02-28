import 'package:chongmeng/components/dynamic/model/item_page_data.dart';
import 'package:chongmeng/function/movie/movie_details/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'model/movie_schedule_entity.dart';

enum MovieDetailsAction {
  SetDetailsData,
  Refresh,
  RefreshSchedule,
  SetScheduleData,
  LoadSchedule,
  SetLoadScheduleData,
}

class MovieDetailsActionCreator {
  static Action onRefresh(p) {
    return Action(MovieDetailsAction.Refresh, payload: p);
  }

  static Action onSetDetailsData(p) {
    return Action(MovieDetailsAction.SetDetailsData, payload: p);
  }

  static Action onRefreshSchedule(Map<String, ItemMovieSchedulePageData> p) {
    return Action(MovieDetailsAction.RefreshSchedule, payload: p);
  }

  static Action onLoadSchedule(Map<String, dynamic> p) {
    return Action(MovieDetailsAction.LoadSchedule, payload: p);
  }

  static Action onSetScheduleData(
      ItemMovieSchedulePageData p, MovieScheduleEntity movieScheduleEntity) {
    return Action(MovieDetailsAction.SetScheduleData, payload: {
      "key": p.filtrateType,
      "data": movieScheduleEntity,
    });
  }

  static Action onSetLoadScheduleData(
      ItemMovieSchedulePageData p, MovieScheduleEntity movieScheduleEntity) {
    return Action(MovieDetailsAction.SetLoadScheduleData, payload: {
      "key": p.filtrateType,
      "data": movieScheduleEntity,
    });
  }
}
