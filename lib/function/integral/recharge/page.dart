import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RechargePage extends Page<RechargeState, Map<String, dynamic>> {
  RechargePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<RechargeState>(
                adapter: null,
                slots: <String, Dependent<RechargeState>>{
                }),
            middleware: <Middleware<RechargeState>>[
            ],);

}
