import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    PetAddState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("添加宠物"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              Navigator.pop(viewService.context);
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "跳过",
                style: TextStyle(color: colorWhite),
              ),
            ),
          ),
        )
      ],
    ),
    body: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0, bottom: 20.0),
              child: GestureDetector(
                onTap: () {
                  dispatch(PetAddActionCreator.onSelectPetAvatar());
                },
                child: Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: of.accentColor,
                      borderRadius: BorderRadius.all((Radius.circular(70.0))),
                      image: state.petAvatar == null
                          ? null
                          : DecorationImage(
                              image: FileImage(state.petAvatar),
                              fit: BoxFit.cover)),
                ),
              ),
            ),
            ...buildItem("昵称", "请输入宠物昵称",
                canEdit: true,
                textEditingController: state.nickTextEditingController,
                state: state,
                dispatch: dispatch,
                viewService: viewService),
            ...buildItem("性别", "选择宠物性别", canEdit: false, hasArrow: true,
                onTap: () {
              dispatch(PetAddActionCreator.onSelectType("sex"));
            },
                textEditingController: state.sexTextEditingController,
                state: state,
                dispatch: dispatch,
                viewService: viewService),
            ...buildItem("生日", "选择生日", canEdit: false, hasArrow: true,
                onTap: () {
              dispatch(PetAddActionCreator.onSelectType("birthday"));
            },
                textEditingController: state.birthdayTextEditingController,
                state: state,
                dispatch: dispatch,
                viewService: viewService),
            ...buildItem("品种", "选择种类", canEdit: false, onTap: () {
              dispatch(PetAddActionCreator.onSelectType("petType"));
            },
                hasArrow: true,
                textEditingController: state.petTypeTextEditingController,
                state: state,
                dispatch: dispatch,
                viewService: viewService),
            ...buildItem("状态", "选择状态", onTap: () {
              dispatch(PetAddActionCreator.onSelectType("status"));
            },
                canEdit: false,
                hasArrow: true,
                textEditingController: state.petStatusTextEditingController,
                state: state,
                dispatch: dispatch,
                viewService: viewService),
          ],
        ),
        Positioned(
          bottom: 0.0,
          child: new Container(
            width: WindowUtils.getScreenWidth() - 60.0,
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(viewService.context).padding.bottom + 30.0,
              left: 30.0,
            ),
            height: 50.0,
            child: new RaisedButton(
              child: new Text(
                '添加宠物',
                textAlign: TextAlign.center,
                style: new TextStyle(fontSize: 18.0, color: colorWhite),
              ),
              onPressed: () {
                dispatch(PetAddActionCreator.onAddPet());
              },
              color: Theme.of(viewService.context).accentColor,
            ),
          ),
        ),
      ],
    ),
  );
}

List<Widget> buildItem(String title, String helperText,
    {bool hasArrow = false,
    bool canEdit = false,
    GestureTapCallback onTap,
    TextEditingController textEditingController,
    PetAddState state,
    Dispatch dispatch,
    ViewService viewService}) {
  var of = Theme.of(viewService.context);
  return [
    InkWell(
      onTap: onTap ?? () {},
      child: SizedBox(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 18.0, left: 10.0),
              child: Text(
                "$title:",
                style: of.textTheme.subhead,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 18.0),
                child: TextField(
                  textAlign: TextAlign.right,
                  enabled: canEdit,
                  controller: textEditingController,
                  decoration: InputDecoration(
                      hintText: helperText, border: InputBorder.none),
                ),
              ),
            ),
            if (hasArrow)
              Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.grey,
                ),
              )
          ],
        ),
      ),
    ),
    VerticalLine()
  ];
}
