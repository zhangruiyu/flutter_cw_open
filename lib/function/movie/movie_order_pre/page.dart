import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MovieOrderPrePage extends Page<MovieOrderPreState, Map<String, dynamic>> {
  MovieOrderPrePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MovieOrderPreState>(
                adapter: null,
                slots: <String, Dependent<MovieOrderPreState>>{
                }),
            middleware: <Middleware<MovieOrderPreState>>[
            ],);

}
