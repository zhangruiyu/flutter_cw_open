import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ShippingAddressPage
    extends Page<ShippingAddressState, Map<String, dynamic>> {
  ShippingAddressPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ShippingAddressState>(
              adapter: null,
              slots: <String, Dependent<ShippingAddressState>>{}),
          middleware: <Middleware<ShippingAddressState>>[],
        );
}
