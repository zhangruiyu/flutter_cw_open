import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SharePage extends Page<ShareState, Map<String, dynamic>> {
  SharePage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ShareState>(
                adapter: null,
                slots: <String, Dependent<ShareState>>{
                }),
            middleware: <Middleware<ShareState>>[
            ],);

}
