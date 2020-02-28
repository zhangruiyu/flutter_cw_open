import 'package:chongmeng/function/main/home/model/ali_product_item.dart';
import 'package:fish_redux/fish_redux.dart';

enum SearchAction {
  ResetData,
  AddData,
  Search,
  Refresh,
  LoadMore,
  SetSearching,
  SetPageState
}

class SearchActionCreator {
  static Action onResetData(List<AliProductItem> data) {
    return Action(SearchAction.ResetData, payload: data);
  }

  static Action onSearch() {
    return const Action(SearchAction.Search);
  }

  static Action onRefresh(data) {
    return Action(SearchAction.Refresh, payload: data);
  }

  static Action onLoadMore(data) {
    return Action(SearchAction.LoadMore, payload: data);
  }

  static Action onAddData(List<AliProductItem> data, index) {
    return Action(SearchAction.AddData,
        payload: {'data': data, 'index': index});
  }

  static Action onSetSearching(bool isSearching) {
    return Action(SearchAction.SetSearching, payload: isSearching);
  }

  static Action onSetPageState(int pageState) {
    return Action(SearchAction.SetPageState, payload: pageState);
  }
}
