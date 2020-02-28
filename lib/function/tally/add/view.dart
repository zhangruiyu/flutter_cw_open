import 'dart:math';

import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/color_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    AddTallyState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  return Scaffold(
    appBar: Toolbar(
      title: Text("添加新笔记"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(AddTallyActionCreator.onAddTally());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "完成",
                style: TextStyle(color: colorWhite),
              ),
            ),
          ),
        )
      ],
    ),
    body: ChipTheme(
      data: Theme.of(viewService.context).chipTheme.copyWith(
              shape: BeveledRectangleBorder(
            side: const BorderSide(
                width: 0.66, style: BorderStyle.solid, color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          )),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2.0),
              itemBuilder: (BuildContext context, int index) {
                var id = state.tags[index].id;
                return FilterChip(
                  selectedColor: Theme.of(viewService.context).accentColor,
                  backgroundColor: ColorUtils.randomColor(index.toString()),
                  label: Text(state.tags[index].name),
                  selected: state.selectId.contains(id),
                  onSelected: (bool value) {
                    dispatch(AddTallyActionCreator.onSetChipCheck(id));
                  },
                );
              },
              itemCount: state.tags.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                      controller: state.remarkTextEditingController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                        labelText: "备注(可不添加)",
                      ),
                      buildCounter: (BuildContext context,
                              {int currentLength,
                              int maxLength,
                              bool isFocused}) =>
                          null,
                      style: TextStyle(
                        fontSize: 20.0,
                      )),
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        dispatch(AddTallyActionCreator.onSelectTallyImage());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 80.0,
                        height: 80.0,
                        decoration: BoxDecoration(
                          color: accentColor,
                          borderRadius:
                              BorderRadius.all((Radius.circular(4.0))),
                        ),
                        child: state.image == null
                            ? Text(
                                "点击此处\n选择图片",
                                textAlign: TextAlign.center,
                              )
                            : Image.file(state.image, fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18.0, right: 18.0, top: 20.0),
            child: TextField(
                controller: state.priceTextEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 20.0, bottom: 10.0),
                  labelText: "金额(可不添加)",
                ),
                buildCounter: (BuildContext context,
                        {int currentLength, int maxLength, bool isFocused}) =>
                    null,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  fontSize: 20.0,
                )),
          ),
          Container(
            width: WindowUtils.getScreenWidth() - 38 * 2,
            height: 45.0,
            margin: const EdgeInsets.only(top: 22.0, left: 38, right: 38),
            child: RaisedButton(
              elevation: 0.0,
              color: Theme.of(viewService.context).accentColor,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(22.0)),
              child: Text(
                  state.takeDate == null ? "设置生效时间" : "生效时间:${state.takeDate}"),
              textColor: colorWhite,
              onPressed: () {
                DatePicker.showDatePicker(viewService.context,
                    locale: DateTimePickerLocale.zh_cn,
                    onConfirm: (DateTime dateTime, List<int> selectedIndex) {
                  dispatch(AddTallyActionCreator.onSetDate(dateTime));
                });
              },
            ),
          ),
        ],
      ),
    ),
  );
}
