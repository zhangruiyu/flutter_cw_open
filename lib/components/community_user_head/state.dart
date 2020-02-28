import 'package:chongmeng/components/dynamic/dynamic_component/state.dart';
import 'package:chongmeng/function/main/community/details/state.dart';
import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class CommunityUserHeadState implements Cloneable<CommunityUserHeadState> {
  DynamicListData data;

  @override
  CommunityUserHeadState clone() {
    return CommunityUserHeadState()..data = data;
  }
}

class CommunityUserHeadConnector
    extends ConnOp<DynamicItemState, CommunityUserHeadState> {
  @override
  CommunityUserHeadState get(DynamicItemState state) {
    return CommunityUserHeadState()..data = state.data;
  }

  @override
  void set(DynamicItemState state, CommunityUserHeadState subState) {
    state.data = subState.data;
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}

class CommunityDetailsUserHeadConnector
    extends ConnOp<DynamicDetailsState, CommunityUserHeadState> {
  @override
  CommunityUserHeadState get(DynamicDetailsState state) {
    return CommunityUserHeadState()..data = state.data;
  }

  @override
  void set(DynamicDetailsState state, CommunityUserHeadState subState) {
    state.data = subState.data;
  }

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
