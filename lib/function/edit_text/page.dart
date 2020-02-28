import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EditTextPage extends Page<EditTextState, Map<String, dynamic>> {
  EditTextPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EditTextState>(
                adapter: null,
                slots: <String, Dependent<EditTextState>>{
                }),
            middleware: <Middleware<EditTextState>>[
            ],);

}
