import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class TallyPage extends Page<TallyState, Map<String, dynamic>> {
  TallyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<TallyState>(
                adapter: null,
                slots: <String, Dependent<TallyState>>{
                }),
            middleware: <Middleware<TallyState>>[
            ],);

}
