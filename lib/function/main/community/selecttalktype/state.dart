import 'package:fish_redux/fish_redux.dart';

class SelectTalkTypeState implements Cloneable<SelectTalkTypeState> {

  @override
  SelectTalkTypeState clone() {
    return SelectTalkTypeState();
  }
}

SelectTalkTypeState initState(Map<String, dynamic> args) {
  return SelectTalkTypeState();
}
