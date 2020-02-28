import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReviewImagePage extends Page<ReviewImageState, Map<String, dynamic>> {
  ReviewImagePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ReviewImageState>(
                adapter: null,
                slots: <String, Dependent<ReviewImageState>>{
                }),
            middleware: <Middleware<ReviewImageState>>[
            ],);

}
