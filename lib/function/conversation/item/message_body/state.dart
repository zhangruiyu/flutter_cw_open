import 'package:fish_redux/fish_redux.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';

class MessageBodyState implements Cloneable<MessageBodyState> {
  JMNormalMessage itemMessage;

  MessageBodyState({this.itemMessage});

  @override
  MessageBodyState clone() {
    return MessageBodyState()..itemMessage = itemMessage;
  }
}
