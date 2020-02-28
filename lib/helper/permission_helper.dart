import 'dart:io';

import 'package:chongmeng/global_store/store.dart';
import 'package:device_info/device_info.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  //检测需要的权限
  static Future<bool> checkPermission() async {
    return (await checkPermissionStatus())
        .values
        .every((item) => item == PermissionStatus.granted);
  } //检测需要的权限

  static Future<bool> requestLocationPermission() async {
    if (Platform.isIOS) {
      return (await PermissionHandler().requestPermissions([
            PermissionGroup.locationWhenInUse,
          ]))[PermissionGroup.locationWhenInUse] ==
          PermissionStatus.granted;
    } else {
      return (await PermissionHandler().requestPermissions(
              [PermissionGroup.location]))[PermissionGroup.location] ==
          PermissionStatus.granted;
    }
  }

  static Future<Map<PermissionGroup, PermissionStatus>>
      checkPermissionStatus() async {
    Map<PermissionGroup, PermissionStatus> permissions;
    if (Platform.isIOS) {
      permissions = (await PermissionHandler().requestPermissions([
        PermissionGroup.contacts,
        PermissionGroup.camera,
        PermissionGroup.microphone,
        PermissionGroup.locationWhenInUse,
      ]))
//        ..remove(PermissionGroup.locationWhenInUse)
          ;
    } else {
      permissions = (await PermissionHandler().requestPermissions([
        PermissionGroup.contacts,
        PermissionGroup.phone,
        PermissionGroup.storage,
        PermissionGroup.location,
        PermissionGroup.camera,
        PermissionGroup.microphone,
      ]))
//        ..remove(PermissionGroup.location)
//        ..remove(PermissionGroup.locationAlways)
//        ..remove(PermissionGroup.locationWhenInUse)
          ;
    }
    return permissions;
  }

  static Future<bool> checkStoragePermission() async {
    var isAgree = (await PermissionHandler().requestPermissions([
      PermissionGroup.storage,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }

  //检测麦克风.摄像头,存储
  static Future<bool> checkStorageCameraMicrophonePermission() async {
    var isAgree = (await PermissionHandler().requestPermissions([
      if (Platform.isAndroid) PermissionGroup.storage,
      PermissionGroup.camera,
      PermissionGroup.microphone,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }

  //检测摄像头,存储
  static Future<bool> checkStorageCameraPermission() async {
    var isAgree = (await PermissionHandler().requestPermissions([
      if (Platform.isAndroid) PermissionGroup.storage,
      PermissionGroup.camera,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }

  //检测麦克风.摄像头,存储
  static Future<bool> checkStorageCameraMicrophonePhotoPermission() async {
    var isAgree = (await PermissionHandler().requestPermissions([
      if (Platform.isAndroid) PermissionGroup.storage,
      if (Platform.isIOS) PermissionGroup.photos,
      PermissionGroup.camera,
      PermissionGroup.microphone,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }

  static Future<bool> checkUpdatePermission() async {
    var isAgree = (await PermissionHandler().requestPermissions([
      PermissionGroup.storage,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }

  static Future<bool> checkPhonePermission() async {
    if (Platform.isIOS) return true;
    var androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt < 29) {
      var isAgree = (await PermissionHandler()
              .requestPermissions([PermissionGroup.phone]))
          .values
          .every((item) => item == PermissionStatus.granted);
      if (!isAgree) {
        PermissionHandler().openAppSettings();
      }
      return isAgree;
    } else {
      return true;
    }
  }

  //开启app需要的权限 必须给
  static Future<bool> checkStartAppPermission() async {
    if (Platform.isIOS) return true;
    var isAgree = (await PermissionHandler().requestPermissions([
      PermissionGroup.phone,
      PermissionGroup.storage,
    ]))
        .values
        .every((item) => item == PermissionStatus.granted);
    if (!isAgree) {
      PermissionHandler().openAppSettings();
    }
    return isAgree;
  }
}
