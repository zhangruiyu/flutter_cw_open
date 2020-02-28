import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SelectSubTypePage extends Page<SelectSubTypeState, Map<String, dynamic>> {
  SelectSubTypePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<SelectSubTypeState>(
                adapter: null,
                slots: <String, Dependent<SelectSubTypeState>>{
                }),
            middleware: <Middleware<SelectSubTypeState>>[
            ],);

}
