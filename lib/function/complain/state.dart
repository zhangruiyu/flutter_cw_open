import 'package:fish_redux/fish_redux.dart';

class ComplainState implements Cloneable<ComplainState> {
  int selectPosition;

  @override
  ComplainState clone() {
    return ComplainState()..selectPosition;
  }
}

ComplainState initState(Map<String, dynamic> args) {
  return ComplainState()..selectPosition = 0;
}
