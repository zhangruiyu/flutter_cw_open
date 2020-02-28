import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class AccountComponent extends Component<AccountState> {
  AccountComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<AccountState>(
                adapter: null,
                slots: <String, Dependent<AccountState>>{
                }),);

}
