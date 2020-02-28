import 'package:fish_redux/fish_redux.dart';

enum CommunityUserHeadAction { action }

class CommunityUserHeadActionCreator {
  static Action onAction() {
    return const Action(CommunityUserHeadAction.action);
  }
}
