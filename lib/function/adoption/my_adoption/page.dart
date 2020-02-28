import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyAdoptionPage extends Page<MyAdoptionState, Map<String, dynamic>> {
  MyAdoptionPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyAdoptionState>(
                adapter: null,
                slots: <String, Dependent<MyAdoptionState>>{
                }),
            middleware: <Middleware<MyAdoptionState>>[
            ],);

}
