import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class UpdatePage extends Page<UpdateState, Map<String, dynamic>> {
  UpdatePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<UpdateState>(
                adapter: null,
                slots: <String, Dependent<UpdateState>>{
                }),
            middleware: <Middleware<UpdateState>>[
            ],);

}
