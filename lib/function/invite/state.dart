import 'package:fish_redux/fish_redux.dart';

import 'model/invite_entity.dart';

class InviteState implements Cloneable<InviteState> {
  InviteData data;

  @override
  InviteState clone() {
    return InviteState()..data = data;
  }
}

InviteState initState(Map<String, dynamic> args) {
  return InviteState();
}
