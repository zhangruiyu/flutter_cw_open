import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IntegralElemeItemComponent extends Component<IntegralElemeItemState> {
  IntegralElemeItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<IntegralElemeItemState>(
                adapter: null,
                slots: <String, Dependent<IntegralElemeItemState>>{
                }),);

}
