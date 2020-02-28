import 'package:chongmeng/components/notice/state.dart';
import 'package:chongmeng/function/main/home/tab/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'adapter/state.dart';
import 'banner/state.dart';
import 'model/home_entity.dart';

class HomeState implements Cloneable<HomeState> {
  HomeData homeData;
  EasyRefreshController controller;
  ScrollController scrollController;

  @override
  HomeState clone() {
    return HomeState()
      ..controller = controller
      ..scrollController = scrollController
      ..homeData = homeData;
  }

  static HomeState initState(Map<String, dynamic> args) {
    return HomeState()
      ..controller = EasyRefreshController()
      ..scrollController = ScrollController();
  }
}

ConnOp<HomeState, BannerState> bannerConnector() {
  return ConnOp<HomeState, BannerState>(
    get: (HomeState state) {
      return BannerState()..bannerData = state.homeData?.banner;
    },
    set: (HomeState state, BannerState subState) {
      throw Exception("不支持改变数据");
    },
  );
}

ConnOp<HomeState, TabState> tabConnector() {
  return ConnOp<HomeState, TabState>(
    get: (HomeState state) {
      return TabState()
        ..tabData = state.homeData?.tab
        ..recipe = state.homeData?.recipe;
    },
    set: (HomeState state, TabState subState) {
      throw Exception("不支持改变数据");
    },
  );
}

class HomeListConnector extends ConnOp<HomeState, HomeListState> {
  @override
  void set(HomeState state, HomeListState subState) {
    state.homeData?.recommendProduct = subState.data;
  }

  @override
  HomeListState get(HomeState state) {
    return HomeListState()..data = state.homeData?.recommendProduct ?? [];
  }
}

class HomeNoticeConnector extends ConnOp<HomeState, NoticeState> {
  @override
  void set(HomeState state, NoticeState subState) {
    super.set(state, subState);
  }

  @override
  NoticeState get(HomeState state) {
    return NoticeState()..itemData = state.homeData?.sysNotices;
  }
}
