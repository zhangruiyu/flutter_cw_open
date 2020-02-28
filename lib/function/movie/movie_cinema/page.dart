import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MovieCinemaPage extends Page<MovieCinemaState, Map<String, dynamic>> {
  MovieCinemaPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MovieCinemaState>(
                adapter: null,
                slots: <String, Dependent<MovieCinemaState>>{
                }),
            middleware: <Middleware<MovieCinemaState>>[
            ],);

}
