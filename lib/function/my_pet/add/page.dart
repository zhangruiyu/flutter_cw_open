import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class PetAddPage extends Page<PetAddState, Map<String, dynamic>> {
  PetAddPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<PetAddState>(
                adapter: null,
                slots: <String, Dependent<PetAddState>>{
                }),
            middleware: <Middleware<PetAddState>>[
            ],);

}
