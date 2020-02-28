import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AppInfoPage extends Page<AppInfoState, Map<String, dynamic>> {
  AppInfoPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AppInfoState>(
                adapter: null,
                slots: <String, Dependent<AppInfoState>>{
                }),
            middleware: <Middleware<AppInfoState>>[
            ],);

}
