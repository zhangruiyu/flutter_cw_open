import 'dart:io';

import 'package:chongmeng/network/entity/cos_entity.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:tencent_cos/tencent_cos.dart';
import 'package:path/path.dart' as path;

class UploadTask {
  String localUrl;
  String cosPath;

  //上传到服务器的 包含排序
  String resourcePath() {
    return "$cosPath${path.basename(File(localUrl).path)}";
  }

//  GlobalKey<ProgressImageState> progressImageKey;

  int sequence;

  UploadTask(this.localUrl);

  Future<String> upload(
    tmpSecretId,
    tmpSecretKey,
    sessionToken,
    expiredTime,
    cosPath,
    region,
    appid,
    bucket,
  ) async {
    this.cosPath = cosPath;
    await TencentCos.uploadByFile(
        region,
        appid,
        bucket,
        tmpSecretId,
        tmpSecretKey,
        sessionToken,
        expiredTime,
        cosPath + localUrl.substring(localUrl.lastIndexOf("/")),
        localUrl.toString());
    return resourcePath();
  }

  Future<String> uploadByData(CosData data) {
    return upload(
      data.tmpSecretId,
      data.tmpSecretKey,
      data.sessionToken,
      data.expiredTime,
      data.cosPath,
      data.region,
      data.appid,
      data.bucket,
    );
  }

  @override
  String toString() {
    return 'UploadTask{localUrl: $localUrl, resourcePath: ${resourcePath()}, sequence: $sequence}';
  }
}
