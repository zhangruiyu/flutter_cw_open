import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class VirtualProductReviewPage extends Page<VirtualProductReviewState, Map<String, dynamic>> {
  VirtualProductReviewPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<VirtualProductReviewState>(
                adapter: null,
                slots: <String, Dependent<VirtualProductReviewState>>{
                }),
            middleware: <Middleware<VirtualProductReviewState>>[
            ],);

}
