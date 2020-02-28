import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'model/cinema_list_entity.dart';

class CinemaListState implements Cloneable<CinemaListState> {
  CinemaListEntity data;
  int pageIndex;

  EasyRefreshController easyRefreshController;

  @override
  CinemaListState clone() {
    return CinemaListState()
      ..data = data
      ..pageIndex = pageIndex
      ..easyRefreshController = easyRefreshController;
  }
}

CinemaListState initState(Map<String, dynamic> args) {
  return CinemaListState()
    ..pageIndex = 0
    ..easyRefreshController = EasyRefreshController();
}
