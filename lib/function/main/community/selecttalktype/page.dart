import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class SelectTalkTypePage
    extends Page<SelectTalkTypeState, Map<String, dynamic>> {
  SelectTalkTypePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<SelectTalkTypeState>(
              adapter: null, slots: <String, Dependent<SelectTalkTypeState>>{}),
          middleware: <Middleware<SelectTalkTypeState>>[],
        );
}
