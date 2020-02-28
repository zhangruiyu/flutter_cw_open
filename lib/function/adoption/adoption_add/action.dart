import 'package:chongmeng/function/main/community/commit_media/model/upload_task.dart';
import 'package:fish_redux/fish_redux.dart';

enum AdoptionAddAction {
  ChangeSelectPic,
  ReselectPic,
  Commit,
  SelectType,
  SetType,
  SetMoneyType
}

class AdoptionAddActionCreator {
  static Action onChangeSelectPic(List<UploadTask> list) {
    return Action(AdoptionAddAction.ChangeSelectPic, payload: list);
  }

  static Action onReselectPic() {
    return const Action(AdoptionAddAction.ReselectPic);
  }

  static Action onCommit() {
    return const Action(AdoptionAddAction.Commit);
  }

  static Action onSelectType(String type) {
    return Action(AdoptionAddAction.SelectType, payload: type);
  }

  static Action onSetType(Map<String, dynamic> petTypeId) {
    return Action(AdoptionAddAction.SetType, payload: petTypeId);
  }

  static Action onSetMoneyType(moneyType) {
    return Action(AdoptionAddAction.SetMoneyType, payload: moneyType);
  }
}
