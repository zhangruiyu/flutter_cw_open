import 'package:chongmeng/constants/colors.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/function/shipping_address/state.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/model/local_user.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/platform_utils.dart';
import 'package:chongmeng/utils/window_utils.dart';
import 'package:extended_image/extended_image.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'state.dart';

Widget buildView(
    AccountState state, Dispatch dispatch, ViewService viewService) {
  var theme = Theme.of(viewService.context);
  var user = state.localUser;
  if (user == null) {
    state.data = null;
  }
  return DefaultTextStyle(
    style: TextStyle(color: colorWhite),
    child: Column(
      children: <Widget>[
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            UserHelper.loginCheck(viewService.context, () {
              Navigator.pushNamed(
                  viewService.context, PageConstants.UserDetailsPage,
                  arguments: {'userId': UserHelper.getOnlineUser().userId});
            });
          },
          child: Container(
            color: theme.accentColor,
            padding: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 30.0),
            child: SafeArea(
              child: user == null
                  ? Row(
                      children: <Widget>[
                        CircleAvatar(
                          child:
                              Image.asset('assets/account_page_no_login.png'),
                          backgroundColor: colorWhite,
                        ),
                        GestureDetector(
                          onTap: () {
                            NavigatorHelper.pushPageLoginPage(
                                viewService.context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text(
                              "登录/注册",
                            ),
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: <Widget>[
                        ClipOval(
                            child: ExtendedImage.network(
                          user.avatar,
                          width: 50.0,
                          height: 50.0,
                          fit: BoxFit.cover,
                          enableLoadState: false,
                        )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                user.nickName,
                                style: theme.textTheme.subhead
                                    .merge(TextStyle(color: colorWhite)),
                              ),
                              Text(
                                user.description?.isEmpty == true
                                    ? "这个人很懒,什么也没有留下~"
                                    : user.description,
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 20.0),
                            alignment: Alignment.centerRight,
                            child: Stack(
                              children: <Widget>[
                                IconButton(
                                  onPressed: () {
                                    NavigatorHelper.pushConversationPage(
                                        viewService.context);
                                  },
                                  icon: Icon(
                                    Icons.message,
                                    color: colorWhite,
                                  ),
                                ),
                                if (state.allUnreadCount > 0)
                                  Positioned(
                                    right: 10.0,
                                    top: 7.0,
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 10.0,
                                      height: 10.0,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
            ),
          ),
        ),
        //关注 宠物
        Container(
          color: theme.accentColor,
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(state.data?.subscribersCount?.toString() ?? "*"),
                    Text("关注")
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Text(state.data?.fans?.toString() ?? "*"),
                    Text("粉丝")
                  ],
                ),
              ),
              Expanded(
                child: InkResponse(
                  onTap: () async {
                    Navigator.pushNamed(
                        viewService.context, PageConstants.IntegralRecordPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Text(state.data?.totalIntegral?.toString() ?? "*"),
                      Text("萌币")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: InkResponse(
                  onTap: () async {
                    Navigator.pushNamed(
                        viewService.context, PageConstants.MyPetPage);
                  },
                  child: Column(
                    children: <Widget>[
                      Text(state.data?.petCount?.toString() ?? "*"),
                      Text("宠物")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: buildList(viewService, state),
            ),
          ),
        )
      ],
    ),
  );
}

List<Widget> buildList(ViewService viewService, AccountState state) {
  return [
    ListTile(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(
            viewService.context,
            PageConstants.MyAdoptionPage,
          );
        });
      },
      title: Text("我发布的领养"),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
        color: const Color(0x40808080),
      ),
    ),
    VerticalLine(),
    ListTile(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(
              viewService.context, PageConstants.ShippingAddressPage,
              arguments: {"type": ShippingAddressState.SEE});
        });
      },
      title: Text("收货地址"),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
        color: const Color(0x40808080),
      ),
    ),
    VerticalLine(),
    ListTile(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(
            viewService.context,
            PageConstants.MyOrderPage,
          );
        });
      },
      title: Text("我的订单"),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
        color: const Color(0x40808080),
      ),
    ),
    VerticalLine(),
    ListTile(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(
            viewService.context,
            PageConstants.SafeCenterPage,
          );
        });
      },
      title: Text("安全中心"),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
        color: const Color(0x40808080),
      ),
    ),
    VerticalLine(),
    ListTile(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(viewService.context, PageConstants.SettingPage);
        });
      },
      title: Text("设置"),
      trailing: new Icon(
        Icons.keyboard_arrow_right,
        size: 30.0,
        color: const Color(0x40808080),
      ),
    ),
    VerticalLine(
      height: 10.0,
    ),
    GestureDetector(
      onTap: () {
        UserHelper.loginCheck(viewService.context, () {
          Navigator.pushNamed(viewService.context, PageConstants.InvitePage);
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: ExtendedImage.asset(
            "assets/invite.png",
            fit: BoxFit.cover,
            width: WindowUtils.getScreenWidth(),
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              state.count++;
              if (state.count > 20) {
                Navigator.pushNamed(
                    viewService.context, PageConstants.AppInfoPage,
                    arguments: {
                      "registrationID": await JiguangUtils.getRegistrationID(),
                      "channel": GlobalStore.store.getState().channel,
//                        "idfa": Platform.isAndroid
//                            ? await yuanmengDeviceInfo.getImei
//                            : (await yuanmengDeviceInfo.idfa),
                    });
              }
            },
            child: Container(
              height: 24.0,
              width: 100.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: colorF9F9F9,
                  border: Border.all(color: color999999),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Text(
                  "${GlobalStore.store.getState().packageInfo.appName ?? "宠窝"} v${GlobalStore.store.getState().packageInfo.version}",
                  style: TextStyle(
                    color: color999999,
                    fontSize: 12.0,
                  )),
            ),
          ),
          GestureDetector(
            onTap: () async {
//                  await launch("tel:4006016868");
            },
            behavior: HitTestBehavior.opaque,
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0, bottom: 18.0),
              child: Text("QQ服务群：609487304",
                  style: TextStyle(
                    color: color999999,
                    fontSize: 12.0,
                  )),
            ),
          ),
        ],
      ),
    )
  ];
}

Container buildNoLoginView(ThemeData theme, ViewService viewService) {
  return Container(
    color: theme.accentColor,
    padding: EdgeInsets.only(left: 20.0, bottom: 30.0, top: 30.0),
    child: SafeArea(
      child: Row(
        children: <Widget>[
          CircleAvatar(
            child: Image.asset('assets/account_page_no_login.png'),
            backgroundColor: colorWhite,
          ),
          GestureDetector(
            onTap: () {
              NavigatorHelper.pushPageLoginPage(viewService.context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "登录/注册",
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
