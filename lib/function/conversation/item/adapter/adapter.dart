import 'package:chongmeng/function/conversation/item/message_body/component.dart';
import 'package:chongmeng/function/conversation/item/message_body/state.dart';
import 'package:chongmeng/function/conversation/item/state.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

import 'reducer.dart';

class MessageBodyAdapter extends DynamicFlowAdapter<ConversationItemState> {
  MessageBodyAdapter()
      : super(
          pool: <String, Component<Object>>{
            'itemMessageBody': MessageBodyComponent()
          },
          connector: _MessageBodyConnector(),
          reducer: buildReducer(),
        );
}

class _MessageBodyConnector
    extends ConnOp<ConversationItemState, List<ItemBean>> {
  @override
  List<ItemBean> get(ConversationItemState state) {
    if (state.messages == null || state.messages.isEmpty)
      return <ItemBean>[];
    else
      return state.messages
          .map((JMNormalMessage itemMessage) => ItemBean(
              'itemMessageBody', MessageBodyState(itemMessage: itemMessage)))
          .toList();
  }

  @override
  void set(ConversationItemState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
