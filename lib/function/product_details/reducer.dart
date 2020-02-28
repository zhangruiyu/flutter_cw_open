import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<ProductDetailsState> buildReducer() {
  return asReducer(
    <Object, Reducer<ProductDetailsState>>{
      ProductDetailsAction.SetDetailsData: _onSetDetailsData,
    },
  );
}

ProductDetailsState _onSetDetailsData(
    ProductDetailsState state, Action action) {
  final ProductDetailsState newState = state.clone()
    ..detailsEntity = action.payload;
  return newState;
}
