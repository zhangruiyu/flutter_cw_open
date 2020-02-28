import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SignInPage extends Page<SignInState, Map<String, dynamic>> {
  SignInPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SignInState>(
                adapter: null,
                slots: <String, Dependent<SignInState>>{
                }),
            middleware: <Middleware<SignInState>>[
            ],);

}
