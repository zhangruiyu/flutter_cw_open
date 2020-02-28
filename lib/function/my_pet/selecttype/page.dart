import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SelectTypePage extends Page<SelectTypeState, Map<String, dynamic>> {
  SelectTypePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            view: buildView,
            dependencies: Dependencies<SelectTypeState>(
                adapter: null,
                slots: <String, Dependent<SelectTypeState>>{
                }),
            middleware: <Middleware<SelectTypeState>>[
            ],);

}
