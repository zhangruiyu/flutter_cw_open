import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class RecipePage extends Page<RecipeState, Map<String, dynamic>> {
  RecipePage()
      : super(
          initState: initState,
          effect: buildEffect(),
          reducer: buildReducer(),
          view: buildView,
          dependencies: Dependencies<RecipeState>(
              adapter: null, slots: <String, Dependent<RecipeState>>{}),
          middleware: <Middleware<RecipeState>>[],
        );
  @override
  ComponentState<RecipeState> createState() {
    return RecipePageState();
  }
}
