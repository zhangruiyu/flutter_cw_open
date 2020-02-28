import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'view.dart';

class AliItemProductComponent extends Component<AliProductItem> {
  AliItemProductComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<AliProductItem>(
              adapter: null, slots: <String, Dependent<AliProductItem>>{}),
        );
}
