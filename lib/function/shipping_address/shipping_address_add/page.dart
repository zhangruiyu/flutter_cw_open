import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ShippingAddressAddPage extends Page<ShippingAddressAddState, Map<String, dynamic>> {
  ShippingAddressAddPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ShippingAddressAddState>(
                adapter: null,
                slots: <String, Dependent<ShippingAddressAddState>>{
                }),
            middleware: <Middleware<ShippingAddressAddState>>[
            ],);

}
