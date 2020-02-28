import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class ItemDynamicContentState implements Cloneable<ItemDynamicContentState> {
  List<DynamicListData> itemTabData;

  @override
  ItemDynamicContentState clone() {
    return ItemDynamicContentState()..itemTabData = itemTabData;
  }
}

ItemDynamicContentState initState(Map<String, dynamic> args) {
  return ItemDynamicContentState();
}
