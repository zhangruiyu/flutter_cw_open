import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecordPage extends Page<RecordState, Map<String, dynamic>> {
  RecordPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RecordState>(
                adapter: null,
                slots: <String, Dependent<RecordState>>{
                }),
            middleware: <Middleware<RecordState>>[
            ],);

}
