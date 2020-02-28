import 'package:chongmeng/function/integral/model/total_integral_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum IntegralRecordAction {
  action,
  Refresh,
  LoadMore,
  AddPageListData,
  AddPageMoreListData,
  SetTotalIntegral,
}

class IntegralRecordActionCreator {
  static Action onAction() {
    return const Action(IntegralRecordAction.action);
  }

  static Action onRefresh(Map<String, dynamic> map) {
    return Action(IntegralRecordAction.Refresh, payload: map);
  }

  static Action onLoadMore(Map<String, dynamic> map) {
    return Action(IntegralRecordAction.LoadMore, payload: map);
  }

  static Action onAddPageListData(Map<String, dynamic> map) {
    return Action(IntegralRecordAction.AddPageListData, payload: map);
  }

  static Action onAddPageMoreListData(Map<String, dynamic> map) {
    return Action(IntegralRecordAction.AddPageMoreListData, payload: map);
  }

  static Action onSetTotalIntegral(TotalIntegralData total) {
    return Action(IntegralRecordAction.SetTotalIntegral, payload: total);
  }
}
