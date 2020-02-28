import 'package:fish_redux/fish_redux.dart';

enum MovieListAction {
  ResetData,
  Refresh,
  SkipMovieDetailsPage,
}

class MovieListActionCreator {
  static Action onRefresh(p) {
    return Action(MovieListAction.Refresh, payload: p);
  }

  static Action onResetData(p) {
    return Action(MovieListAction.ResetData, payload: p);
  }

  static Action onSkipMovieDetailsPage(p) {
    return Action(MovieListAction.SkipMovieDetailsPage, payload: p);
  }
}
