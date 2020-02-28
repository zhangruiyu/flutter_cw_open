import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SafeCenterPage extends Page<SafeCenterState, Map<String, dynamic>> {
  SafeCenterPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SafeCenterState>(
                adapter: null,
                slots: <String, Dependent<SafeCenterState>>{
                }),
            middleware: <Middleware<SafeCenterState>>[
            ],);

}
