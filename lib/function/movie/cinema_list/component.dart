import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class CinemaListComponent extends Component<CinemaListState> {
  CinemaListComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<CinemaListState>(
                adapter: null,
                slots: <String, Dependent<CinemaListState>>{
                }),);

}
