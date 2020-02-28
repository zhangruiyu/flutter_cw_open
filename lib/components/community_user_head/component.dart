import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CommunityUserHeadComponent extends Component<CommunityUserHeadState> {
  CommunityUserHeadComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CommunityUserHeadState>(
                adapter: null,
                slots: <String, Dependent<CommunityUserHeadState>>{
                }),);

}
