import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AdoptionDetailsPage extends Page<AdoptionDetailsState, Map<String, dynamic>> {
  AdoptionDetailsPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AdoptionDetailsState>(
                adapter: null,
                slots: <String, Dependent<AdoptionDetailsState>>{
                }),
            middleware: <Middleware<AdoptionDetailsState>>[
            ],);

}
