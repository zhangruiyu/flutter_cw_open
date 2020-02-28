import 'package:chongmeng/function/main/community/details/model/comment_entity.dart';
import 'package:chongmeng/function/main/community/details/reply_component/component.dart';
import 'package:chongmeng/function/main/community/details/reply_component/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'reducer.dart';
import 'state.dart';

class ReplyListAdapter extends DynamicFlowAdapter<ReplyListState> {
  ReplyListAdapter()
      : super(
          pool: <String, Component<Object>>{'reply': ReplyComponent()},
          connector: _ReplyListConnector(),
          reducer: buildReducer(),
        );
}

class _ReplyListConnector extends ConnOp<ReplyListState, List<ItemBean>> {
  @override
  List<ItemBean> get(ReplyListState state) {
    if (state?.data?.isNotEmpty == true) {
      return state.data
          .map<ItemBean>(
              (CommentData data) => ItemBean('reply', ReplyState(data: data)))
          .toList(growable: true);
    } else {
      return <ItemBean>[];
    }
  }

  @override
  void set(ReplyListState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
