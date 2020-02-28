import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'item_dynamic_content_adapter/adapter.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class ItemDynamicAdapterComponent extends Component<ItemDynamicAdapterState> {
  ItemDynamicAdapterComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<ItemDynamicAdapterState>(
              adapter: itemDynamicListConnector() + ItemDynamicContentAdapter(),
              slots: <String, Dependent<ItemDynamicAdapterState>>{}),
        );
}
