import 'package:chongmeng/components/dynamic/adapter/adapter.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommunityComponent extends Component<CommunityState> {
  CommunityComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<CommunityState>(
            slots: <String, Dependent<CommunityState>>{},
            adapter: communityListConnector() + UserDetailsDynamicAdapter(),
          ),
        );

  @override
  ComponentState<CommunityState> createState() {
    return CommunityPageState();
  }

  static const DynamicTypePic = 0;
  static const DynamicTypeVideo = 1;
  static const DynamicTypeText = 2;
}
