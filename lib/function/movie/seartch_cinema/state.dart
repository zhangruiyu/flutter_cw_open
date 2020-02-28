import 'package:fish_redux/fish_redux.dart';

class SearchCinemaState implements Cloneable<SearchCinemaState> {

  @override
  SearchCinemaState clone() {
    return SearchCinemaState();
  }
}

SearchCinemaState initState(Map<String, dynamic> args) {
  return SearchCinemaState();
}
