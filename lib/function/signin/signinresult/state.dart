import 'package:chongmeng/function/signin/model/sign_in_result_entity.dart';
import 'package:fish_redux/fish_redux.dart';

class SignInResultDialogState implements Cloneable<SignInResultDialogState> {
  SignInResultData pageData;

  @override
  SignInResultDialogState clone() {
    return SignInResultDialogState()..pageData = pageData;
  }
}

SignInResultDialogState initState(Map<String, dynamic> args) {
  return SignInResultDialogState()..pageData = args['pageData'];
}
