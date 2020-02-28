import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class NoticeComponent extends Component<NoticeState> {
  NoticeComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<NoticeState>(
                adapter: null,
                slots: <String, Dependent<NoticeState>>{
                }),);

}
