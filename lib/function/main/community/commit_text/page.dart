import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommitTextPage extends Page<CommitTextState, Map<String, dynamic>> {
  CommitTextPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommitTextState>(
                adapter: null,
                slots: <String, Dependent<CommitTextState>>{
                }),
            middleware: <Middleware<CommitTextState>>[
            ],);

}
