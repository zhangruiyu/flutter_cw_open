import 'package:chongmeng/constants/colors.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

double filtrateBarHeight = 48.0;
var titles = {
  '综合': [SearchFiltrateState.synthesize],
  '销量': [SearchFiltrateState.volume],
  '价格': [SearchFiltrateState.price_asc, SearchFiltrateState.price_desc],
};
var priceType = [SearchFiltrateState.price_asc, SearchFiltrateState.price_desc];

Widget buildView(
    SearchFiltrateState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: titles.keys.map((title) {
      List<int> type = titles[title];
      int newType;
      if (type.length > 1) {
        //首次点击选第一个
        if (type.contains(state.type)) {
          if (type.indexOf(state.type) == 0) {
            newType = type[1];
          } else {
            newType = type[0];
          }
        } else {
          newType = type[0];
        }
      } else {
        newType = type[0];
      }

      return Expanded(
        child: InkWell(
          child: Container(
            alignment: Alignment.center,
            height: filtrateBarHeight,
            child: AnimatedContainer(
              decoration: type.contains(state.type)
                  ? BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(15.0),
                      ),
                      border: Border.all(
                        color: Colors.white,
                        width: 1.0,
                      ),
                    )
                  : null,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(color: colorWhite),
                    ),
                    if (priceType.contains(state.type) &&
                        priceType.contains(newType))
                      Text(
                        "(${state.type == SearchFiltrateState.price_asc ? "升" : "降"})",
                        style: TextStyle(color: colorWhite, fontSize: 8.0),
                      )
                  ],
                ),
              ),
              duration: Duration(seconds: 1),
            ),
          ),
          onTap: () {
            dispatch(SearchFiltrateActionCreator.onSetTypeAndSearch(newType));
          },
        ),
      );
    }).toList(),
  );
}
