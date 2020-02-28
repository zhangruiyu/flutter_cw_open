import 'package:fish_redux/fish_redux.dart';

enum InviteAction { ReSetData, Refresh, Share }

class InviteActionCreator {
  static Action onReSetData(p) {
    return Action(InviteAction.ReSetData, payload: p);
  }

  static Action onRefresh(p) {
    return Action(InviteAction.Refresh, payload: p);
  }

  static Action onShare() {
    return Action(InviteAction.Share);
  }
}
