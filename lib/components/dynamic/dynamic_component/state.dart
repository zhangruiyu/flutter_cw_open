import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class DynamicItemState implements Cloneable<DynamicItemState> {
  DynamicListData data;

  @override
  DynamicItemState clone() {
    return DynamicItemState()..data = data;
  }

  DynamicItemState({this.data});
}
