import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AdoptionComponent extends Component<AdoptionState> {
  AdoptionComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AdoptionState>(
                adapter: null,
                slots: <String, Dependent<AdoptionState>>{
                }),);

}
