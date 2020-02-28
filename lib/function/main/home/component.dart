import 'package:chongmeng/components/notice/component.dart';
import 'package:fish_redux/fish_redux.dart';

import 'adapter/adapter.dart';
import 'banner/component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'tab/component.dart';
import 'view.dart';

class HomeComponent extends Component<HomeState> {
  HomeComponent()
      : super(
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<HomeState>(
              adapter: HomeListConnector() + HomeListAdapter(),
              slots: <String, Dependent<HomeState>>{
                'banner': bannerConnector() + BannerComponent(),
                'tab': tabConnector() + TabComponent(),
                'notice': HomeNoticeConnector() + NoticeComponent()
              }),
        );
}
