import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class ItemDynamicAdapterState implements Cloneable<ItemDynamicAdapterState> {
  List<DynamicListData> data;

  ItemDynamicAdapterState({this.data});

  @override
  ItemDynamicAdapterState clone() {
    return ItemDynamicAdapterState()..data = data;
  }
}
