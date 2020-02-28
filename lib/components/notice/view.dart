import 'package:chongmeng/constants/colors.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vertical_marquee/flutter_vertical_marquee.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    NoticeState state, Dispatch dispatch, ViewService viewService) {
  return state.itemData?.isNotEmpty == true
      ? Container(
          height: 37.0,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                ),
                child: Image.asset(
                  "assets/home_page_icon_gonggao.png",
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {},
                    child: Container(
                      height: 34.0,
                      child: Marquee(
                        fontSize: 12.0,
                        textColor: color343434,
                        aligment: MarqueeAligment.left,
                        textList: state.itemData.map((itemNotice) {
                          return itemNotice;
                        }).toList(),
//                        controller: MarqueeController(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      : Container();
}
