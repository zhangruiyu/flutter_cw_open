import 'package:chongmeng/function/main/community/model/dynamic_list_entity.dart';
import 'package:chongmeng/function/user_details/state.dart';
import 'package:fish_redux/fish_redux.dart';

class UserDetailsDynamicState implements Cloneable<UserDetailsDynamicState> {
  List<List<DynamicListData>> tabData;

  @override
  UserDetailsDynamicState clone() {
    return UserDetailsDynamicState()..tabData = tabData;
  }
}
