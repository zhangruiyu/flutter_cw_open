import 'package:chongmeng/function/movie/movie_details/model/movie_schedule_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/cinema_movies_entity.dart';

class MovieCinemaState implements Cloneable<MovieCinemaState> {
  MovieScheduleCinema movieScheduleData;
  int movieId;

  CinemaMoviesEntity cinemaMovies;

  int selectIndex;
  int hideCount;
  ScrollController movieScrollController;

  @override
  MovieCinemaState clone() {
    return MovieCinemaState()
      ..cinemaMovies = cinemaMovies
      ..movieId = movieId
      ..hideCount = hideCount
      ..movieScrollController = movieScrollController
      ..movieScheduleData = movieScheduleData
      ..selectIndex = selectIndex;
  }
}

MovieCinemaState initState(Map<String, dynamic> args) {
  return MovieCinemaState()
    ..movieId = args['movieId']
    ..movieScheduleData = args['movieScheduleData']
    ..selectIndex = 0
    ..hideCount = 2;
}
