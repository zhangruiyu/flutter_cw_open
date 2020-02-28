import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MovieDetailsPage extends Page<MovieDetailsState, Map<String, dynamic>> {
  MovieDetailsPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<MovieDetailsState>(
              adapter: null, slots: <String, Dependent<MovieDetailsState>>{}),
          middleware: <Middleware<MovieDetailsState>>[],
        );
  @override
  ComponentState<MovieDetailsState> createState() {
    return MovieDetailsPageState();
  }
}
