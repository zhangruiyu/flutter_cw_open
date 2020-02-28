import 'package:chongmeng/function/integral/recharge/model/pay_result_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class PayResultState implements Cloneable<PayResultState> {
  PayResultData data;

  @override
  PayResultState clone() {
    return PayResultState()..data = data;
  }
}

PayResultState initState(Map<String, dynamic> args) {
  return PayResultState()..data = args['data'];
}
