import 'package:chongmeng/routes.dart';
import 'package:chongmeng/function/main/home/model/home_entity.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';

import 'state.dart';

Widget buildView(TabState state, Dispatch dispatch, ViewService viewService) {
  return Column(
    children: <Widget>[
      SizedBox(
        height: 80.0,
        child: Row(
          children: state.tabData
              .sublist(0, 5)
              .map<Widget>(
                  (itemMenu) => buildItem(state, itemMenu, viewService))
              .toList(),
        ),
      ),
      /*if (state.tabData.length > 5)
        SizedBox(
          height: 80.0,
          child: Row(
            children: state.tabData
                .sublist(4, state.tabData.length)
                .map<Widget>(
                    (itemMenu) => buildItem(state, itemMenu, viewService))
                .toList(),
          ),
        ),*/
    ],
  );
}

buildItem(TabState state, HomeDataTab itemMenu, viewService) {
  return Expanded(
    child: GestureDetector(
      onTap: () {
        if (itemMenu.action == "write") {
          UserHelper.loginCheck(viewService.context, () {
            Navigator.pushNamed(viewService.context, PageConstants.TallyPage);
          });
          UserHelper.loginCheck(viewService.context, () {});
        } else if (itemMenu.action == "cat" || itemMenu.action == "dog") {
          Navigator.pushNamed(viewService.context, PageConstants.SearchPage,
              arguments: {'initChip': itemMenu.chips});
        } else if (itemMenu.action == "recipe") {
          Navigator.pushNamed(viewService.context, PageConstants.RecipePage,
              arguments: {'recipe': state.recipe});
        } else if (itemMenu.action == "signin") {
          UserHelper.loginCheck(viewService.context, () {
            Navigator.pushNamed(viewService.context, PageConstants.SignInPage);
          });
          UserHelper.loginCheck(viewService.context, () {});
        } else {
          showToast("此功能正在开发中");
        }
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          itemMenu.imageUrl.startsWith("http")
              ? ExtendedImage.network(
                  itemMenu.imageUrl,
                  enableLoadState: false,
                )
              : new Image.asset(
                  itemMenu.imageUrl,
                  height: 40.0,
                  width: 40.0,
                  fit: BoxFit.contain,
                ),
          Text(itemMenu.title)
        ],
      ),
    ),
  );
}
