import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Effect<AdoptionDetailsState> buildEffect() {
  return combineEffects(<Object, Effect<AdoptionDetailsState>>{
    AdoptionDetailsAction.ShowAdoptionDialog: _onShowAdoptionDialog,
  });
}

Future _onShowAdoptionDialog(
    Action action, Context<AdoptionDetailsState> ctx) async {
  NavigatorHelper.skipConversationItemPageByUserId(
      ctx.context, ctx.state.data.userId);
}
