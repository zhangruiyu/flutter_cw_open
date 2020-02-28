import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MovieCityPage extends Page<MovieCityState, Map<String, dynamic>> {
  MovieCityPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MovieCityState>(
                adapter: null,
                slots: <String, Dependent<MovieCityState>>{
                }),
            middleware: <Middleware<MovieCityState>>[
            ],);

}
