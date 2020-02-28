import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchCinemaPage extends Page<SearchCinemaState, Map<String, dynamic>> {
  SearchCinemaPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchCinemaState>(
                adapter: null,
                slots: <String, Dependent<SearchCinemaState>>{
                }),
            middleware: <Middleware<SearchCinemaState>>[
            ],);

}
