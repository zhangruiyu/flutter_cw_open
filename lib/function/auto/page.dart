import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AutoPage extends Page<AutoState, Map<String, dynamic>> {
  AutoPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<AutoState>(
              adapter: null, slots: <String, Dependent<AutoState>>{}),
          middleware: <Middleware<AutoState>>[],
        );
}
