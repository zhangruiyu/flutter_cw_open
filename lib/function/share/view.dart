import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:umengshare/umengshare.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(ShareState state, Dispatch dispatch, ViewService viewService) {
  return SafeArea(
    child: Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (state.title != null) state.title,
          Row(
            children: <Widget>[
              _buildShareItem(state, "assets/qq.png", "QQ", UMSharePlatform.QQ,
                  viewService.context),
              _buildShareItem(state, "assets/qq_zone.png", "QQ空间",
                  UMSharePlatform.Qzone, viewService.context),
            ],
          ),
          Row(
            children: <Widget>[
              _buildShareItem(state, "assets/wechat.png", "微信",
                  UMSharePlatform.WechatSession, viewService.context),
              _buildShareItem(state, "assets/wechat_time_line.png", "朋友圈",
                  UMSharePlatform.WechatTimeLine, viewService.context),
            ],
          ),
          if (state.args['type'] == ShareState.h5)
            InkWell(
              onTap: () {
                ClipboardData data = new ClipboardData(text: state.args['url']);
                Clipboard.setData(data);
                showToast("复制成功,快去分享吧QAQ");
                Navigator.pop(viewService.context);
              },
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text("复制链接"),
              ),
            ),
          VerticalLine(),
          InkWell(
            onTap: () {
              Navigator.pop(viewService.context);
            },
            child: Container(
              alignment: Alignment.center,
              width: WindowUtils.getScreenWidth(),
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Text("取消"),
            ),
          )
        ],
      ),
    ),
  );
}

Widget _buildShareItem(ShareState state, String image, String name,
    UMSharePlatform platformType, BuildContext context) {
  return Expanded(
    child: InkWell(
      onTap: () async {
        var result;
        if (state.args['type'] == ShareState.text) {
          result =
              await UMengShare.shareText(platformType, state.args['content']);
        } else if (state.args['type'] == ShareState.h5) {
          result = await UMengShare.shareMedia(
              platformType,
              UMShareMediaType.WebUrl,
              state.args['content'],
              state.args['dec'],
              "https://chomgwo-1253631018.cos.ap-beijing.myqcloud.com/common/logo.png",
              state.args['url']);
        }
        Navigator.pop(context, result);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Image.asset(image),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                name,
                style: TextStyle(color: color333333, fontSize: 15.0),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
