import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/widget/custom_dialog.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    SignInResultDialogState state, Dispatch dispatch, ViewService viewService) {
  var accentColor = Theme.of(viewService.context).accentColor;
  return Container(
    child: CanSetWidthDialog(
        minWidth: 275.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                  color: colorWhite),
              width: double.infinity,
              margin: const EdgeInsets.only(top: 90.0),
              padding: const EdgeInsets.only(bottom: 22.0, top: 100.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: "+${state.pageData.addIntegral}",
                          style: TextStyle(
                              fontSize: 25.0,
                              color: accentColor,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: "积分",
                          style:
                              TextStyle(fontSize: 18.0, color: Colors.black)),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "已连续签到",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black)),
                        TextSpan(
                            text: state.pageData.continuousSignCount.toString(),
                            style:
                                TextStyle(fontSize: 15.0, color: accentColor)),
                        TextSpan(
                            text: "天",
                            style:
                                TextStyle(fontSize: 15.0, color: Colors.black)),
                      ]),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset("assets/signin_page_sign_success.png"),
            Padding(
              padding: const EdgeInsets.only(top: 298.0, bottom: 15.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(viewService.context);
                },
                icon: Icon(
                  Icons.close,
                  color: colorWhite,
                ),
              ),
            )
          ],
        )),
  );
}
