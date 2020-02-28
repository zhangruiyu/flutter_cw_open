import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MovieSeatPage extends Page<MovieSeatState, Map<String, dynamic>> {
  MovieSeatPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MovieSeatState>(
                adapter: null,
                slots: <String, Dependent<MovieSeatState>>{
                }),
            middleware: <Middleware<MovieSeatState>>[
            ],);

}
