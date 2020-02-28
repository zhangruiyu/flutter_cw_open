import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chongmeng/constants/constants.dart';
import 'package:chongmeng/constants/http_constants.dart';
import 'package:chongmeng/entity_factory.dart';
import 'package:chongmeng/generated/json/base/json_convert_content.dart';
import 'package:chongmeng/global_store/store.dart';
import 'package:chongmeng/helper/navigator_helper.dart';
import 'package:chongmeng/helper/user_helper.dart';
import 'package:chongmeng/network/net_exception.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:oktoast/oktoast.dart';

class RequestClient {
  ///[queryParameters] 参数以map形式
  ///[showLoadingIndicator] 为true时显示加载数据弹框 默认是false
  ///[isPost] 为true时是post请求,默认是true
  static Future<Result<T>> request<T>(
    BuildContext context,
    String requestUrl, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    bool isPost = true,
    bool showLoadingIndicator = false,
    String contentType = "application/x-www-form-urlencoded",
    bool ignoreToast = false,
  }) async {
    if (showLoadingIndicator) {
      NavigatorHelper.showLoadingDialog(context, true);
    }
    try {
      T result = await _request<T>(context, requestUrl,
          queryParameters: queryParameters,
          isPost: isPost,
          showLoadingIndicator: showLoadingIndicator,
          contentType: contentType,
          ignoreToast: ignoreToast,
          header: header);
      if (showLoadingIndicator) {
        NavigatorHelper.showLoadingDialog(context, false);
      }

      return Future<Result<T>>.value(Result<T>.iniSuccess(result));
    } on NetException catch (e) {
//      buyMoreLlamas();
      if (context != null &&
          !ignoreToast &&
          !ErrorCode.ignoreToastCode.contains(e.code)) {
        showToast('${e.message}');
      }
      return Future<Result<T>>.value(Result.iniFail(e));
    } on DioError catch (e) {
      if (context != null && !ignoreToast) {
        showToast('网络错误$e');
      }
      // 非具体类型
      print('Something really unknown: ${e.message}');
      return Future<Result<T>>.value(Result.iniFail(
          NetException(code: ErrorCode.NormalError, message: "网络请求失败")));
    } finally {
      if (showLoadingIndicator) {
        NavigatorHelper.showLoadingDialog(context, false);
      }
    }
  }

  static Future<T> _request<T>(
    BuildContext context,
    String requestUrl, {
    Map<String, dynamic> queryParameters,
    Map<String, dynamic> header,
    bool isPost = true,
    bool showLoadingIndicator = false,
    String contentType = "application/x-www-form-urlencoded; charset=UTF-8",
    bool ignoreToast = false,
  }) async {
    var globalState = GlobalStore.store.getState();
    BaseOptions baseOptions = new BaseOptions(
        baseUrl: requestUrl.startsWith("http") ? "" : HttpConstants.BaseUrl,
        connectTimeout: 40000,
        receiveTimeout: 40000,
        headers: {
          'os': Platform.operatingSystem,
          'version': globalState?.packageInfo?.version,
          'token': UserHelper.getUserToken(),
          'channel': GlobalStore.state.channel,
          if (header != null) ...header
        });

    if (isPost) {
      baseOptions.contentType = contentType;
    }
    Dio dio = new Dio(baseOptions);
//    String cookiePath = await UserHelper.getCookiePath();
    //打不出日志看这里
    if (!isRelease) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true)); //开启请求日志
    }
    var commonParams = {"channel": globalState.channel};
    if (queryParameters != null) {
      queryParameters.addAll(commonParams);
    } else {
      queryParameters = commonParams;
    }
    Response response = await (isPost
        ? dio.post(requestUrl, data: queryParameters)
        : dio.get(requestUrl, queryParameters: queryParameters));

    if (response.statusCode == HttpStatus.ok) {
      var data = response.data;

      if (requestUrl.startsWith("http")) {
        return new Future.value(EntityFactory.generateOBJ<T>(response.data) ??
            JsonConvert.fromJsonAsT<T>(response.data));
      } else if (data['status'].toString() == ErrorCode.Login.toString()) {
        UserHelper.logout(context);
        return new Future.error(
            new NetException(code: data['status'], message: data['msg']));
      } else if (data['status'].toString() == '0') {
        return new Future.value(EntityFactory.generateOBJ<T>(response.data) ??
            JsonConvert.fromJsonAsT<T>(response.data));
      } else if (data['status'].toString() == '4') {
//          NavigatorHelper.pushPage(context, PageConstants.AuthPage);
        return new Future.error(new NetException(
            code: data['status'],
            message: data['msg'],
            errorData: data['data']));
      } else {
        String toastMsg = data['msg'];
        String status = data['status']?.toString();
        if (toastMsg.contains("Cookie") ||
            toastMsg.contains("尚未登录") ||
            status == "7000" ||
            toastMsg.contains("Token")) {
          UserHelper.logout(context);
        } else {
          if (context != null && !ignoreToast) {
            showToast(toastMsg);
          }
        }
        return new Future.error(new NetException(
            code: data['status'],
            message: data['msg'],
            errorData: data['data']));
      }
    } else {
      debugPrint(response.toString());
      if (response.statusCode == 400) {
        return new Future.error(new NetException(
            code: response.statusCode,
            message:
                "Error getting IP address:\nHttp status ${response.statusCode}"));
      } else {
        return new Future.error(new NetException(
            code: response.statusCode, message: response.toString()));
      }
    }
  }
}

class Result<T> {
  bool hasError;
  bool hasSuccess;
  T data;

  //错误
  NetException error;

  Result.iniSuccess(
    this.data,
  )   : this.hasError = false,
        this.hasSuccess = true;

  Result.iniFail(this.error)
      : this.hasError = true,
        this.hasSuccess = false;

  Result<T> yes(YesCallBack<T> value) {
    if (hasSuccess) {
      value(data);
    }
    return this;
  }

  Result<T> no(NoCallBack err) {
    if (hasError) {
      err(error);
    }
    return this;
  }
}

typedef void YesCallBack<T>(T result);
typedef void NoCallBack(NetException err);

class ErrorCode {
  static int NormalError = 500;
  static int BIND_TEL_ERROR_CODE = 1002; // 第三方登录需要绑定手机号
  static int Login = 1003; // 下线
  static int RECHARGE = 1004; // 积分不足,请充值
  static int ELEME_GET_CODE = 1005; // 饿了么领券,需要验证码
  static List<int> ignoreToastCode = [BIND_TEL_ERROR_CODE, RECHARGE];
}
