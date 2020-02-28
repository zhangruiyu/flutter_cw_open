import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class BannerState implements Cloneable<BannerState> {
  List<AliProductItem> bannerData;

  @override
  BannerState clone() {
    return BannerState();
  }
}

BannerState initState(Map<String, dynamic> args) {
  return BannerState();
}
