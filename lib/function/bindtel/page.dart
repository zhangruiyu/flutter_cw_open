import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class BindTelPage extends Page<BindTelState, Map<String, dynamic>> {
  BindTelPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<BindTelState>(
                adapter: null,
                slots: <String, Dependent<BindTelState>>{
                }),
            middleware: <Middleware<BindTelState>>[
            ],);

}
