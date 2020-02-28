import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IntegralCommodityDetailPage extends Page<IntegralCommodityDetailState, Map<String, dynamic>> {
  IntegralCommodityDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<IntegralCommodityDetailState>(
                adapter: null,
                slots: <String, Dependent<IntegralCommodityDetailState>>{
                }),
            middleware: <Middleware<IntegralCommodityDetailState>>[
            ],);

}
