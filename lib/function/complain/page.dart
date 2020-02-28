import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ComplainPage extends Page<ComplainState, Map<String, dynamic>> {
  ComplainPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ComplainState>(
                adapter: null,
                slots: <String, Dependent<ComplainState>>{
                }),
            middleware: <Middleware<ComplainState>>[
            ],);

}
