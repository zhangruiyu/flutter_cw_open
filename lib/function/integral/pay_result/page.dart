import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PayResultPage extends Page<PayResultState, Map<String, dynamic>> {
  PayResultPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PayResultState>(
                adapter: null,
                slots: <String, Dependent<PayResultState>>{
                }),
            middleware: <Middleware<PayResultState>>[
            ],);

}
