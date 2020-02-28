import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class TabState implements Cloneable<TabState> {
  List<HomeDataTab> tabData;

  List<HomeDataRecipe> recipe;

  @override
  TabState clone() {
    return TabState()
      ..tabData = tabData
      ..recipe = recipe;
  }
}
