import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class TabComponent extends Component<TabState> {
  TabComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<TabState>(
              adapter: null, slots: <String, Dependent<TabState>>{}),
        );
}
