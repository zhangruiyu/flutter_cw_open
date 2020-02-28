import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class InvitePage extends Page<InviteState, Map<String, dynamic>> {
  InvitePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<InviteState>(
                adapter: null,
                slots: <String, Dependent<InviteState>>{
                }),
            middleware: <Middleware<InviteState>>[
            ],);

}
