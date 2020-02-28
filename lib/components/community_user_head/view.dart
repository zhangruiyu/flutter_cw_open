import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import '../../routes.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(
    CommunityUserHeadState state, Dispatch dispatch, ViewService viewService) {
  return Padding(
    padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
    child: GestureDetector(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(
              viewService.context, PageConstants.UserDetailsPage,
              arguments: {'userId': state.data.userId});
        });
      },
      child: Row(
        children: <Widget>[
          ClipOval(
              child: ExtendedImage.network(
            state.data.avatar,
            width: 40.0,
            height: 40.0,
            fit: BoxFit.cover,
            enableLoadState: false,
          )),
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(state.data.nickName),
                Text(
                  "新车上路",
                  style: TextStyle(fontSize: 12.0, color: color7E7E7E),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
