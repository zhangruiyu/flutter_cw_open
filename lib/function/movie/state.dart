import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/function/movie/movie_list/state.dart'
    as MovieListState;
import 'package:chongmeng/function/movie/cinema_list/state.dart'
    as CinemaListState;
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'model/hot_movie_entity.dart';

class MovieState implements Cloneable<MovieState> {
  int pageIndex;
  Location location;
  String districtText;
  List<Widget> views;
  MovieListState.MovieListState movieListState;
  CinemaListState.CinemaListState cinemaListState;

  @override
  MovieState clone() {
    return MovieState()
      ..cinemaListState = cinemaListState
      ..movieListState = movieListState
      ..views = views
      ..pageIndex = pageIndex
      ..districtText = districtText
      ..location = location;
  }
}

MovieState initState(Map<String, dynamic> args) {
  return MovieState()
    ..movieListState = MovieListState.initState(args)
    ..cinemaListState = CinemaListState.initState(args)
    ..districtText = "正在定位"
    ..pageIndex = 0;
}

ConnOp<MovieState, MovieListState.MovieListState> moveListConnector() {
  return ConnOp<MovieState, MovieListState.MovieListState>(
    get: (MovieState state) {
      return state.movieListState.clone();
    },
    set: (MovieState state, MovieListState.MovieListState subState) {
      state.movieListState = subState.clone();
    },
  );
}

ConnOp<MovieState, CinemaListState.CinemaListState> cinemaListConnector() {
  return ConnOp<MovieState, CinemaListState.CinemaListState>(
    get: (MovieState state) {
      return state.cinemaListState.clone();
    },
    set: (MovieState state, CinemaListState.CinemaListState subState) {
      state.cinemaListState = subState.clone();
    },
  );
}
