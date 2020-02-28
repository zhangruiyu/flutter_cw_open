import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/function/auto/model/login_entity.dart';
import 'package:chongmeng/function/conversation/item/page.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/permission_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_work.dart';
import 'package:chongmeng/routes.dart';
import 'package:chongmeng/utils/jiguang_utils.dart';
import 'package:chongmeng/utils/model/jiguang_entity.dart';
import 'package:dio/dio.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:image_picker_saver/image_picker_saver.dart';
import 'package:jmessage_flutter/jmessage_flutter.dart';
import 'package:markdown/markdown.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:photo/photo.dart';
import 'package:photo_manager/photo_manager.dart';

class NavigatorHelper {
  static popToMain(BuildContext context) {
    Navigator.popUntil(context, ModalRoute.withName(PageConstants.MainPage));
  }

  static popToMainByIndex(BuildContext context, int index) {
    popToMain(context);
//    MainPage.bottomNavigationKey?.currentState?.setNewState(index);
  }

  static OverlayEntry _overlayEntry;

  //是否显示load的dialog
  static showLoadingDialog(BuildContext context, bool isLoading) {
    if (isLoading) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      //获取OverlayState
      OverlayState overlayState = Overlay.of(context);
      //创建OverlayEntry
      _overlayEntry = OverlayEntry(
          builder: (BuildContext context) => Container(
                alignment: Alignment.center,
                child: new CircularProgressIndicator(
                  strokeWidth: 4.0,
                  backgroundColor: Color(0xff7E7E7E),
                  // value: 0.2,
//                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                color: Colors.black38,
              ));
      //显示到屏幕上。
      overlayState.insert(_overlayEntry);
    } else {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  static void pushWebPage(BuildContext context, String title, String url) {
    Navigator.pushNamed(context, PageConstants.WebviewPage,
        arguments: {'title': title, 'url': url});
  }

  static void pushWebPageMarkdown(
      BuildContext context, String title, String content) {
    NavigatorHelper.pushWebPage(
        context,
        "title",
        new Uri.dataFromString(markdownToHtml(content), mimeType: 'text/html')
            .toString());
  }

  static Future<T> pushRecordPage<T>(BuildContext context,
      {bool isPop: true}) async {
    bool isAgree =
        await PermissionHelper.checkStorageCameraMicrophonePermission();
    if (isAgree) {
      var cameras = await availableCameras();
      if (isPop) {
        return await Navigator.popAndPushNamed(
            context, PageConstants.RecordPage,
            arguments: {"cameras": cameras});
      }
      return await Navigator.pushNamed<T>(context, PageConstants.RecordPage,
          arguments: {"cameras": cameras});
    } else
      return null;
  }

  static Future<List<File>> pushFileSelectPageFile(BuildContext context,
      {int maxSelected = 9}) async {
    List<AssetEntity> imgList = await PhotoPicker.pickAsset(
        context: context,
        pickType: PickType.onlyImage,
        maxSelected: maxSelected);
    return Future.wait(imgList.map((item) async {
      return (await item.file);
    }).toList());
  }

  static Future<List<String>> pushFileSelectPageString(BuildContext context,
      {int maxSelected = 9}) async {
    if (await PermissionHelper.checkStorageCameraMicrophonePhotoPermission()) {
      return (await pushFileSelectPageFile(context, maxSelected: maxSelected))
          .map<String>((File itemFile) => itemFile.path)
          .toList();
    } else {
      showToast("请先打开权限");
      return null;
    }
  }

  static Future pushPageLoginPage(BuildContext context) async {
    var returnResult;
    var checkVerifyEnable = await JiguangUtils.checkVerifyEnable();
    if (checkVerifyEnable) {
      //支持
      NavigatorHelper.showLoadingDialog(context, true);
      Map<dynamic, dynamic> initAndOpenShanyanLogin =
          await JiguangUtils.loginAuth();
      print("initAndOpenShanyanLogin $initAndOpenShanyanLogin");
      print(
          "initAndOpenShanyanLogin ${initAndOpenShanyanLogin['code'] == 6001}");
      NavigatorHelper.showLoadingDialog(context, false);
      if (initAndOpenShanyanLogin['code'] == 6000) {
        var registrationID = await JiguangUtils.getRegistrationID();
        var queryParameters = {
          "devToken": registrationID, //极光推送设备ID(选填)
          "loginToken": Uri.encodeComponent(initAndOpenShanyanLogin['message']),
          "channel": GlobalStore.store.getState().channel,
        };
        var result = await RequestClient.request<LoginEntity>(
            context, HttpConstants.Flashlogin,
            queryParameters: queryParameters, showLoadingIndicator: true);
        if (result.hasSuccess) {
          UserHelper.loginNoPop(result.data.data, context);
          returnResult = Future.value();
        } else {
          returnResult =
              await Navigator.pushNamed(context, PageConstants.AutoPage);
        }
      } else if (initAndOpenShanyanLogin['code'] == 1011) {
        await Navigator.pushNamed(context, PageConstants.AutoPage);
      } else if (initAndOpenShanyanLogin['code'] == 6002) {
        //取消一键登录
      } else {
        print("initAndOpenShanyanLogin 2222");
        returnResult =
            await Navigator.pushNamed(context, PageConstants.AutoPage);
      }
    } else {
      returnResult = await Navigator.pushNamed(context, PageConstants.AutoPage);
    }
    if (UserHelper.isLogin()) {
      //注册登录im
      loginIM(context);
    }
    return returnResult;
  }

  ///跳转到所有会话页面
  static Future pushConversationPage(BuildContext context) async {
    var user = loginIM(context);
    if (user != null) {
      Navigator.pushNamed(context, PageConstants.ConversationPage);
    } else {
      showToast("请检查您的网络");
    }
  }

  ///登录im
  static Future<JMUserInfo> loginIM(BuildContext context) async {
    JMUserInfo user = await jmessage.getMyInfo();
    if (user == null) {
      var result = await RequestClient.request<JiguangEntity>(
          context, HttpConstants.ImLogin,
          showLoadingIndicator: true);
      if (result.hasSuccess) {
        try {
          var localUser = GlobalStore.store.getState().localUser;
          await jmessage.userRegister(
              username: result.data.data.userName,
              password: result.data.data.password,
              nickname: localUser.nickName);
        } catch (e) {
          println("已经注册");
        }
      }
      user = await jmessage.login(
          username: result.data.data.userName,
          password: result.data.data.password);
    }
    if (user != null && user.avatarThumbPath?.isEmpty == true) {
      var response = await Dio().get(UserHelper.getOnlineUser().avatar,
          options: Options(responseType: ResponseType.bytes));

      debugPrint(response.statusCode.toString());

      File path = await File((await getApplicationDocumentsDirectory()).path +
              "/${DateTime.now().millisecondsSinceEpoch}.png")
          .writeAsBytes(Uint8List.fromList(response.data));
      await jmessage.updateMyAvatar(imgPath: path.path);
      path.delete();
    }
    //昵称修改
    if (user != null && user.nickname != UserHelper.getOnlineUser().nickName) {
      await jmessage.updateMyInfo(
          nickname: UserHelper.getOnlineUser().nickName);
    }
    user = await jmessage.getMyInfo();
    println("nicknamenicknamenickname:" + user.avatarThumbPath);

    return user;
  }

  ///跳转到单个会话页面
  static Future skipConversationItemPage(
      BuildContext context, JMConversationInfo jmConversationInfo) async {
    if (jmConversationInfo.target is JMUserInfo) {
      var targetType = jmConversationInfo.target.targetType;
      List<JMNormalMessage> messages = (await jmessage.getHistoryMessages(
              type: targetType,
              from: 0 * ConversationItemPage.LocalMessagePageSize,
              limit: ConversationItemPage.LocalMessagePageSize,
              isDescend: true))
          .map((item) {
        return item as JMNormalMessage;
      }).toList();
      println(
          "初始化 ${messages.map((itemMessage) => (itemMessage).toJson()).toString()}");
      return Navigator.pushNamed(context, PageConstants.ConversationItemPage,
          arguments: {
            'messages': messages,
            "conversationInfo": jmConversationInfo
          });
    }
  }

  ///跳转到对应userid会话页面
  static Future skipConversationItemPageByUserId(
      BuildContext context, int userId) async {
    JMConversationInfo conversation = await jmessage.createConversation(
        target: JMSingle.fromJson({
      'username': JiguangUtils.imUserNamePrefix + userId.toString(),
      "appKey": JiguangUtils.JpushKey
    }));
    NavigatorHelper.skipConversationItemPage(context, conversation);
  }
}
