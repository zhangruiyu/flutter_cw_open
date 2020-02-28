import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/function/main/community/state.dart';
import 'package:chongmeng/function/user_details/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'item_dynamic_adapter_component/component.dart';
import 'item_dynamic_adapter_component/state.dart';
import 'state.dart';

class UserDetailsDynamicAdapter
    extends DynamicFlowAdapter<UserDetailsDynamicState> {
  UserDetailsDynamicAdapter()
      : super(
          pool: <String, Component<Object>>{
            'item_dynamic_adapter': ItemDynamicAdapterComponent()
          },
          connector: _UserDetailsDynamicConnector(),
        );
}

class _UserDetailsDynamicConnector
    extends ConnOp<UserDetailsDynamicState, List<ItemBean>> {
  @override
  List<ItemBean> get(UserDetailsDynamicState state) {
    if (state.tabData == null || state.tabData.isEmpty)
      return <ItemBean>[];
    else
      return state.tabData
          .map((List<DynamicListData> itemTabData) => ItemBean(
              'item_dynamic_adapter',
              ItemDynamicAdapterState(data: itemTabData)))
          .toList();
  }

  @override
  void set(UserDetailsDynamicState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}

//个人详情页的连接器
ConnOp<UserDetailsState, UserDetailsDynamicState>
    userDetailsDynamicListConnector() {
  return ConnOp<UserDetailsState, UserDetailsDynamicState>(
    get: (UserDetailsState state) {
      return UserDetailsDynamicState()
        ..tabData =
            state.pageData.values.map(((itemTab) => itemTab.data)).toList();
    },
    set: (UserDetailsState state, UserDetailsDynamicState subState) {
      throw Exception("不支持改变数据");
    },
  );
}

//个人详情页的连接器
ConnOp<CommunityState, UserDetailsDynamicState> communityListConnector() {
  return ConnOp<CommunityState, UserDetailsDynamicState>(
    get: (CommunityState state) {
      return UserDetailsDynamicState()
        ..tabData =
            state.pageData.values.map(((itemTab) => itemTab.data)).toList();
    },
    set: (CommunityState state, UserDetailsDynamicState subState) {
      throw Exception("不支持改变数据");
    },
  );
}
