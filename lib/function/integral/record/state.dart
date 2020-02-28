import 'package:chongmeng/function/integral/model/integral_record_entity.dart';
import 'package:chongmeng/function/integral/model/total_integral_entity.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class IntegralRecordState implements Cloneable<IntegralRecordState> {
  List<IntegralRecordData> data;
  int index;
  TotalIntegralData totalIntegral;
  EasyRefreshController easyRefreshController;

  @override
  IntegralRecordState clone() {
    return IntegralRecordState()
      ..data = data
      ..totalIntegral = totalIntegral
      ..index = index
      ..easyRefreshController = easyRefreshController;
  }
}

IntegralRecordState initState(Map<String, dynamic> args) {
  return IntegralRecordState()
    ..data = []
    ..index = 0
    ..easyRefreshController = EasyRefreshController();
}
