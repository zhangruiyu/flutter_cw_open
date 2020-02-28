import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:city_pickers/city_pickers.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    ShippingAddressAddState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: Toolbar(
      title: Text("添加收货地址"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(ShippingAddressAddActionCreator.onCommitAddress());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text("保存"),
            ),
          ),
        )
      ],
    ),
    body: Column(
      children: <Widget>[
        VerticalLine(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text("收货人"),
              ),
              Expanded(
                child: TextFormField(
                  autofocus: true,
                  controller: state.consigneeTextEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "收货人姓名"),
                ),
              ),
            ],
          ),
        ),
        VerticalLine(),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text("手机号码"),
              ),
              Expanded(
                child: TextFormField(
                  maxLength: 11,
                  keyboardType: TextInputType.phone,
                  controller: state.telTextEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "11位手机号"),
                  buildCounter: (BuildContext context,
                          {int currentLength, int maxLength, bool isFocused}) =>
                      null,
                ),
              ),
            ],
          ),
        ),
        VerticalLine(),
        InkWell(
          onTap: () async {
            dispatch(ShippingAddressAddActionCreator.onSelectCity());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 18.0),
                  child: Text("选择地区"),
                ),
                Expanded(
                  child: TextFormField(
                    enabled: false,
                    controller: state.areaTextEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "地区信息"),
                  ),
                ),
                new Icon(
                  Icons.keyboard_arrow_right,
                  size: 30.0,
                  color: const Color(0x40808080),
                ),
              ],
            ),
          ),
        ),
        VerticalLine(),
        Padding(
          padding: const EdgeInsets.only(left: 18.0, right: 18.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: Text("详细地址"),
              ),
              Expanded(
                child: TextFormField(
                  maxLength: 50,
                  controller: state.addressTextEditingController,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "详细地址"),
                  buildCounter: (BuildContext context,
                          {int currentLength, int maxLength, bool isFocused}) =>
                      null,
                ),
              ),
            ],
          ),
        ),
        VerticalLine(),
      ],
    ),
  );
}
