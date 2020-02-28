import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ConversationPage extends Page<ConversationState, Map<String, dynamic>> {
  ConversationPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<ConversationState>(
                adapter: null,
                slots: <String, Dependent<ConversationState>>{
                }),
            middleware: <Middleware<ConversationState>>[
            ],);

}
