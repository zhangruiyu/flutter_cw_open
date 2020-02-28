import 'package:amap_location_fluttify/amap_location_fluttify.dart';
import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';

class MovieListState implements Cloneable<MovieListState> {
  HotMovieEntity data;
  Location location;
  String districtText;

  @override
  MovieListState clone() {
    return MovieListState()
      ..districtText = districtText
      ..location = location
      ..data = data;
  }
}

MovieListState initState(Map<String, dynamic> args) {
  return MovieListState()..districtText = "正在定位";
}
