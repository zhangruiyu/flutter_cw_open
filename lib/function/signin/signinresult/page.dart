import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SignInResultDialogPage extends Page<SignInResultDialogState, Map<String, dynamic>> {
  SignInResultDialogPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SignInResultDialogState>(
                adapter: null,
                slots: <String, Dependent<SignInResultDialogState>>{
                }),
            middleware: <Middleware<SignInResultDialogState>>[
            ],);

}
