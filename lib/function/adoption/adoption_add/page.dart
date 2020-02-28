import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AdoptionAddPage extends Page<AdoptionAddState, Map<String, dynamic>> {
  AdoptionAddPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AdoptionAddState>(
                adapter: null,
                slots: <String, Dependent<AdoptionAddState>>{
                }),
            middleware: <Middleware<AdoptionAddState>>[
            ],);

}
