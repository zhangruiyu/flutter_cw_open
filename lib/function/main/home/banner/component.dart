import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'state.dart';
import 'view.dart';

class BannerComponent extends Component<BannerState> {
  BannerComponent()
      : super(
          effect: buildEffect(),
          view: buildView,
          dependencies: Dependencies<BannerState>(
              adapter: null, slots: <String, Dependent<BannerState>>{}),
        );
}
