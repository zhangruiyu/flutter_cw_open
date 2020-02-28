import 'package:chongmeng/function/movie/movie_cinema/model/cinema_movies_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum MovieCinemaAction {
  RefreshMovies,
  SetRefreshMovies,
  ChangeMovieIndex,
  SkipMovieSeatPage
}

class MovieCinemaActionCreator {
  static Action onRefreshMovies() {
    return const Action(MovieCinemaAction.RefreshMovies);
  }

  static Action onSetRefreshMovies(CinemaMoviesEntity value) {
    return Action(MovieCinemaAction.SetRefreshMovies, payload: value);
  }

  static Action onChangeMovieIndex(int index) {
    return Action(MovieCinemaAction.ChangeMovieIndex, payload: index);
  }

  static Action onSkipMovieSeatPage(CinemaMoviesShowdataMoviesShowsPlist plist,
      CinemaMoviesShowdataMovie selectCinemaMovie) {
    return Action(MovieCinemaAction.SkipMovieSeatPage, payload: {
      'plist': plist,
      'selectCinemaMovie': selectCinemaMovie,
    });
  }
}
