import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';

import 'model/recharge_commodity_entity.dart';
import 'model/wx_pay_entity.dart';

class RechargeState implements Cloneable<RechargeState> {
  List<RechargeCommodityData> data;
  int selectItemPosition;
  WxPayData payPre;
  TextEditingController moneyTextEditingController;

  @override
  RechargeState clone() {
    return RechargeState()
      ..data = data
      ..selectItemPosition = selectItemPosition
      ..moneyTextEditingController = TextEditingController()
      ..payPre = payPre;
  }
}

RechargeState initState(Map<String, dynamic> args) {
  return RechargeState()..selectItemPosition = 0;
}
