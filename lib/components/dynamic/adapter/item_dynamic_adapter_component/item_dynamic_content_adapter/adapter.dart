import 'package:chongmeng/components/dynamic/dynamic_component/component.dart';
import 'package:chongmeng/components/dynamic/dynamic_component/state.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

import '../state.dart';
import 'state.dart';

class ItemDynamicContentAdapter
    extends DynamicFlowAdapter<ItemDynamicContentState> {
  ItemDynamicContentAdapter()
      : super(
          pool: <String, Component<Object>>{'dynamic': DynamicItemComponent()},
          connector: _ItemDynamicContentConnector(),
        );
}

class _ItemDynamicContentConnector
    extends ConnOp<ItemDynamicContentState, List<ItemBean>> {
  @override
  List<ItemBean> get(ItemDynamicContentState state) {
    if (state.itemTabData == null || state.itemTabData.isEmpty)
      return <ItemBean>[];
    else
      return state.itemTabData
          .map((DynamicListData item) =>
              ItemBean('dynamic', DynamicItemState(data: item)))
          .toList();
  }

  @override
  void set(ItemDynamicContentState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    // TODO: implement subReducer
    return super.subReducer(reducer);
  }
}

ConnOp<ItemDynamicAdapterState, ItemDynamicContentState>
    itemDynamicListConnector() {
  return ConnOp<ItemDynamicAdapterState, ItemDynamicContentState>(
    get: (ItemDynamicAdapterState state) {
      return ItemDynamicContentState()..itemTabData = state.data;
    },
    set: (ItemDynamicAdapterState state, ItemDynamicContentState subState) {
      throw Exception("不支持改变数据");
    },
  );
}
