import 'package:fish_redux/fish_redux.dart';

class NoticeState implements Cloneable<NoticeState> {
  List<String> itemData;

  NoticeState({this.itemData});

  @override
  NoticeState clone() {
    return NoticeState()..itemData = itemData;
  }
}

NoticeState initState(Map<String, dynamic> args) {
  return NoticeState();
}
