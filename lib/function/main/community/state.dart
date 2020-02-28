import 'dart:collection';

import 'package:chongmeng/components/dynamic/model/item_page_data.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'model/dynamic_list_entity.dart';

class CommunityState implements Cloneable<CommunityState> {
  TabController tabController;
  LinkedHashMap<String, ItemPageData> pageData;

  @override
  CommunityState clone() {
    return CommunityState()
      ..tabController = tabController
      ..pageData = pageData;
  }

  static CommunityState initState(Map<String, dynamic> args) {
    return CommunityState()
      ..pageData = LinkedHashMap.from({
        NewType: ItemPageData(
            name: "最新",
            filtrateType: NewType,
            data: [],
            pageIndex: 0,
            easyRefreshController: EasyRefreshController()),
        VideoType: ItemPageData(
            name: "视频",
            filtrateType: VideoType,
            data: [],
            pageIndex: 0,
            easyRefreshController: EasyRefreshController())
      });
  }

  static final String NewType = "NewType";
  static final String VideoType = "VideoType";
}

class CommunityPageState extends ComponentState<CommunityState>
    with SingleTickerProviderStateMixin {}
