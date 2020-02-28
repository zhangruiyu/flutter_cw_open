import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyOrderPage extends Page<MyOrderState, Map<String, dynamic>> {
  MyOrderPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyOrderState>(
                adapter: null,
                slots: <String, Dependent<MyOrderState>>{
                }),
            middleware: <Middleware<MyOrderState>>[
            ],);

}
