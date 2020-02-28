import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MyPetPage extends Page<MyPetState, Map<String, dynamic>> {
  MyPetPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MyPetState>(
                adapter: null,
                slots: <String, Dependent<MyPetState>>{
                }),
            middleware: <Middleware<MyPetState>>[
            ],);

}
