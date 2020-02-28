import 'package:chongmeng/components/notice/component.dart';
import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class StoreComponent extends Component<StoreState> {
  StoreComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<StoreState>(
              adapter: IntegralStoreConnector() + IntegralStoreAdapter(),
              slots: <String, Dependent<StoreState>>{
                'notice': IntegralNoticeConnector() + NoticeComponent()
              }),
        );
}
