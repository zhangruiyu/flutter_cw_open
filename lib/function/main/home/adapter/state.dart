import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

class HomeListState implements Cloneable<HomeListState> {
  List<AliProductItem> data;

  @override
  HomeListState clone() {
    return HomeListState()..data;
  }
}

HomeListState initState(Map<String, dynamic> args) {
  return HomeListState();
}
