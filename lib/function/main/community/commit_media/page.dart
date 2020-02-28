import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommitMediaPage extends Page<CommitMediaState, Map<String, dynamic>> {
  CommitMediaPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommitMediaState>(
                adapter: null,
                slots: <String, Dependent<CommitMediaState>>{
                }),
            middleware: <Middleware<CommitMediaState>>[
            ],);

}
