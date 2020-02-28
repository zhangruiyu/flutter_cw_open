import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'message_body/component.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ConversationItemPage
    extends Page<ConversationItemState, Map<String, dynamic>> {
  ConversationItemPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ConversationItemState>(
              adapter: NoneConn<ConversationItemState>() + MessageBodyAdapter(),
              slots: <String, Dependent<ConversationItemState>>{
//                  'message':MessageBodyComponent()
              }),
          middleware: <Middleware<ConversationItemState>>[],
        );
  static const int LocalMessagePageSize = 20;
}
