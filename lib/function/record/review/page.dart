import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReviewIVPage extends Page<ReviewIVState, Map<String, dynamic>> {
  ReviewIVPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReviewIVState>(
                adapter: null,
                slots: <String, Dependent<ReviewIVState>>{
                }),
            middleware: <Middleware<ReviewIVState>>[
            ],);

}
