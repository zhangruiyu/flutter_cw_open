import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/widget/Toolbar.dart';
import 'package:chongmeng/widget/vertical_line.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    UserDetailsEditState state, Dispatch dispatch, ViewService viewService) {
  var of = Theme.of(viewService.context);
  return Scaffold(
    appBar: Toolbar(
      title: Text("个人资料"),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 22.0),
          child: InkResponse(
            onTap: () {
              dispatch(UserDetailsEditActionCreator.onUpdateUserInfo());
            },
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "修改",
                style: TextStyle(color: colorWhite),
              ),
            ),
          ),
        )
      ],
    ),
    body: Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            dispatch(UserDetailsEditActionCreator.onReselectAvatar());
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 18.0, left: 10.0),
                  child: Text(
                    "头像",
                    style: of.textTheme.subhead,
                  ),
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: state.localAvatar == null
                            ? ExtendedImage.network(
                                state.data.avatar,
                                fit: BoxFit.cover,
                                width: 60.0,
                                height: 60.0,
                                enableLoadState: false,
                              )
                            : Image.asset(
                                state.localAvatar.path,
                                fit: BoxFit.cover,
                                width: 60.0,
                                height: 60.0,
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 7.0),
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        VerticalLine(),
        ...buildItem("昵称",
            canEdit: false,
            textEditingController: state.nickTextEditingController,
            hasArrow: true, onTap: () {
          dispatch(UserDetailsEditActionCreator.onAmendText("nick"));
        }, state: state, dispatch: dispatch, viewService: viewService),
        ...buildItem("性别",
            canEdit: false,
            hasArrow: true,
            textEditingController: state.sexTextEditingController, onTap: () {
          dispatch(UserDetailsEditActionCreator.onReselectSex());
        }, state: state, dispatch: dispatch, viewService: viewService),
        ...buildItem("城市", canEdit: false, hasArrow: true, onTap: () {
          dispatch(UserDetailsEditActionCreator.onReselectCity());
        },
            state: state,
            textEditingController: state.cityTextEditingController,
            dispatch: dispatch,
            viewService: viewService),
        ...buildItem("个性签名",
            canEdit: false,
            textEditingController: state.descriptionTextEditingController,
            hasArrow: true, onTap: () async {
          dispatch(UserDetailsEditActionCreator.onAmendText("description"));
        }, state: state, dispatch: dispatch, viewService: viewService),
      ],
    ),
  );
}

List<Widget> buildItem(String title,
    {bool hasArrow = false,
    bool canEdit = false,
    GestureTapCallback onTap,
    TextEditingController textEditingController,
    UserDetailsEditState state,
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
                "$title",
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
                  decoration: InputDecoration(border: InputBorder.none),
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
