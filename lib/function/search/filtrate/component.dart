import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SearchFiltrateComponent extends Component<SearchFiltrateState> {
  SearchFiltrateComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SearchFiltrateState>(
                adapter: null,
                slots: <String, Dependent<SearchFiltrateState>>{
                }),);

}
