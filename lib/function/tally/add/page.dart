import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AddTallyPage extends Page<AddTallyState, Map<String, dynamic>> {
  AddTallyPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AddTallyState>(
                adapter: null,
                slots: <String, Dependent<AddTallyState>>{
                }),
            middleware: <Middleware<AddTallyState>>[
            ],);

}
