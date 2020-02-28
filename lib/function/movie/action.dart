import 'package:fish_redux/fish_redux.dart';

enum MovieAction {
  Share,
  SelectCity,
  SetDistrictText,
  ChangeNewPage,
  ShowSearch
}

class MovieActionCreator {
  static Action onShare() {
    return Action(MovieAction.Share);
  }

  static Action onShowSearch() {
    return Action(MovieAction.ShowSearch);
  }

  static Action onSelectCity() {
    return Action(MovieAction.SelectCity);
  }

  static Action onSetDistrictText(t) {
    return Action(MovieAction.SetDistrictText, payload: t);
  }

  static Action onChangeNewPage(int index) {
    return Action(MovieAction.ChangeNewPage, payload: index);
  }
}
