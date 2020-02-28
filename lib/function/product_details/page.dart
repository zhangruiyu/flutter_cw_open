import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ProductDetailsPage extends Page<ProductDetailsState, Map<String, dynamic>> {
  ProductDetailsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ProductDetailsState>(
                adapter: null,
                slots: <String, Dependent<ProductDetailsState>>{
                }),
            middleware: <Middleware<ProductDetailsState>>[
            ],);

}
