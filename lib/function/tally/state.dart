import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import 'entity/current_user_tally_entity.dart';

class TallyState implements Cloneable<TallyState> {
  List<CurrentUserTallyData> data;
  EasyRefreshController easyRefreshController;

  @override
  TallyState clone() {
    return TallyState()
      ..data = data
      ..easyRefreshController = easyRefreshController;
  }
}

TallyState initState(Map<String, dynamic> args) {
  return TallyState()..easyRefreshController = EasyRefreshController();
}
