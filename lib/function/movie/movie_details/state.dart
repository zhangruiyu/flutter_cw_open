import 'dart:collection';

import 'package:chongmeng/components/dynamic/model/item_page_data.dart';
import 'package:chongmeng/function/movie/model/hot_movie_entity.dart';
import 'package:chongmeng/utils/date_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'model/movie_details_entity.dart';
import 'model/movie_schedule_entity.dart';

class MovieDetailsState implements Cloneable<MovieDetailsState> {
  HotMovieDataMovielist itemMovie;
  MovieDetailsDetailmovie detailMovie;

  LinkedHashMap<DateTime, ItemMovieSchedulePageData> pageData;

  TabController tabController;

  @override
  MovieDetailsState clone() {
    return MovieDetailsState()
      ..pageData = pageData
      ..tabController = tabController
      ..itemMovie = itemMovie
      ..detailMovie = detailMovie;
  }
}

MovieDetailsState initState(Map<String, dynamic> args) {
  DateTime today = DateTime.now();
  DateTime tomorrow = DateTime.now().add(Duration(days: 1));
  DateTime todayThree = DateTime.now().add(Duration(days: 2));
  return MovieDetailsState()
    ..itemMovie = args['movie']
    ..pageData = LinkedHashMap.from({
      today: ItemMovieSchedulePageData(
          name: "今天${DateUtils.formatDataMovie(today)}",
          filtrateType: today,
          data: [],
          pageIndex: 0,
          easyRefreshController: EasyRefreshController()),
      tomorrow: ItemMovieSchedulePageData(
          name: "明天${DateUtils.formatDataMovie(today)}",
          filtrateType: tomorrow,
          data: [],
          pageIndex: 0,
          easyRefreshController: EasyRefreshController()),
      todayThree: ItemMovieSchedulePageData(
          name: "后天${DateUtils.formatDataMovie(todayThree)}",
          filtrateType: todayThree,
          data: [],
          pageIndex: 0,
          easyRefreshController: EasyRefreshController()),
    });
}

class MovieDetailsPageState extends ComponentState<MovieDetailsState>
    with SingleTickerProviderStateMixin {}

class ItemMovieSchedulePageData {
  String name;
  DateTime filtrateType;
  int pageIndex;
  EasyRefreshController easyRefreshController;
  List<MovieScheduleCinema> data;

  ItemMovieSchedulePageData(
      {this.name,
      this.filtrateType,
      this.data,
      this.pageIndex,
      this.easyRefreshController});
}
