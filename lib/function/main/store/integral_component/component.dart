import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class IntegralItemComponent extends Component<IntegralItemState> {
  IntegralItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<IntegralItemState>(
                adapter: null,
                slots: <String, Dependent<IntegralItemState>>{
                }),);

}
