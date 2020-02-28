import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class MessageBodyComponent extends Component<MessageBodyState> {
  MessageBodyComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<MessageBodyState>(
                adapter: null,
                slots: <String, Dependent<MessageBodyState>>{
                }),);

}
