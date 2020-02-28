import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class WebVirtualProductPreviewPage
    extends Page<WebVirtualProductPreviewState, Map<String, dynamic>> {
  WebVirtualProductPreviewPage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<WebVirtualProductPreviewState>(
              adapter: null,
              slots: <String, Dependent<WebVirtualProductPreviewState>>{}),
          middleware: <Middleware<WebVirtualProductPreviewState>>[],
        );
}
