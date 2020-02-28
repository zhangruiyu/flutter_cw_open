import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UserDetailsEditPage extends Page<UserDetailsEditState, Map<String, dynamic>> {
  UserDetailsEditPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UserDetailsEditState>(
                adapter: null,
                slots: <String, Dependent<UserDetailsEditState>>{
                }),
            middleware: <Middleware<UserDetailsEditState>>[
            ],);

}
