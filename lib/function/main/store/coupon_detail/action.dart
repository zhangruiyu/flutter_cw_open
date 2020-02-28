import 'package:chongmeng/function/main/store/coupon_detail/model/coupon_entity.dart';
import 'package:fish_redux/fish_redux.dart';

enum CouponDetailAction {
  SetCoupon,
  GetCoupon,
  OpenEleme,
  ChangeSelectPosition,
  ElemeCode,
  Share
}

class CouponDetailActionCreator {
  static Action onSetCoupon(List<CouponData> data) {
    return Action(CouponDetailAction.SetCoupon, payload: data);
  }

  static Action onGetCoupon() {
    return const Action(CouponDetailAction.GetCoupon);
  }

  static Action onOpenEleme() {
    return const Action(CouponDetailAction.OpenEleme);
  }

  static Action onChangeSelectPosition(int index) {
    return Action(CouponDetailAction.ChangeSelectPosition, payload: index);
  }

  static Action onElemeCode(String type) {
    return Action(CouponDetailAction.ElemeCode, payload: type);
  }

  static Action onShare() {
    return Action(CouponDetailAction.Share);
  }
}
