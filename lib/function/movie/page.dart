import 'package:fish_redux/fish_redux.dart';

import 'cinema_list/component.dart';
import 'effect.dart';
import 'movie_list/component.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MoviePage extends Page<MovieState, Map<String, dynamic>> {
  MoviePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MovieState>(
              adapter: null,
              slots: <String, Dependent<MovieState>>{
                'move_list': moveListConnector() + MovieListComponent(),
                'cinema_list': cinemaListConnector() + CinemaListComponent(),
              }),
          middleware: <Middleware<MovieState>>[],
        );
}
