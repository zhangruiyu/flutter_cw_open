import 'package:chongmeng/components/community_user_head/component.dart';
import 'package:chongmeng/components/community_user_head/state.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ReplyComponent extends Component<ReplyState> {
  ReplyComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ReplyState>(
              adapter: null, slots: <String, Dependent<ReplyState>>{}),
        );
}
