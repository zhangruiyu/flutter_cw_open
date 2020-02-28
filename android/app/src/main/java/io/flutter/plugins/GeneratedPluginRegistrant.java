package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import me.yohom.amap_core_fluttify.AmapCoreFluttifyPlugin;
import me.yohom.amap_location_fluttify.AmapLocationFluttifyPlugin;
import io.flutter.plugins.camera.CameraPlugin;
import com.example.citypickers.CityPickersPlugin;
import io.flutter.plugins.deviceinfo.DeviceInfoPlugin;
import top.kikt.ijkplayer.IjkplayerPlugin;
import com.jarvan.fluwx.FluwxPlugin;
import me.yohom.foundation_fluttify.FoundationFluttifyPlugin;
import io.flutter.plugins.imagepicker.ImagePickerPlugin;
import io.flutter.plugins.imagepickersaver.ImagePickerSaverPlugin;
import com.jiguang.janalytics.JanalyticsPlugin;
import com.jiguang.jmessageflutter.JmessageFlutterPlugin;
import com.jiguang.jpush.JPushPlugin;
import com.jiguang.jverify.JverifyPlugin;
import io.flutter.plugins.packageinfo.PackageInfoPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import com.baseflow.permissionhandler.PermissionHandlerPlugin;
import top.kikt.imagescanner.ImageScannerPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;
import com.ruiyu.tencentcos.tencentcos.TencentCosPlugin;
import com.asapjay.thumbnails.ThumbnailsPlugin;
import cn.ugle.flutter.umengshare.UmengsharePlugin;
import io.flutter.plugins.urllauncher.UrlLauncherPlugin;
import io.flutter.plugins.webviewflutter.WebViewFlutterPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AmapCoreFluttifyPlugin.registerWith(registry.registrarFor("me.yohom.amap_core_fluttify.AmapCoreFluttifyPlugin"));
    AmapLocationFluttifyPlugin.registerWith(registry.registrarFor("me.yohom.amap_location_fluttify.AmapLocationFluttifyPlugin"));
    CameraPlugin.registerWith(registry.registrarFor("io.flutter.plugins.camera.CameraPlugin"));
    CityPickersPlugin.registerWith(registry.registrarFor("com.example.citypickers.CityPickersPlugin"));
    DeviceInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.deviceinfo.DeviceInfoPlugin"));
    IjkplayerPlugin.registerWith(registry.registrarFor("top.kikt.ijkplayer.IjkplayerPlugin"));
    FluwxPlugin.registerWith(registry.registrarFor("com.jarvan.fluwx.FluwxPlugin"));
    FoundationFluttifyPlugin.registerWith(registry.registrarFor("me.yohom.foundation_fluttify.FoundationFluttifyPlugin"));
    ImagePickerPlugin.registerWith(registry.registrarFor("io.flutter.plugins.imagepicker.ImagePickerPlugin"));
    ImagePickerSaverPlugin.registerWith(registry.registrarFor("io.flutter.plugins.imagepickersaver.ImagePickerSaverPlugin"));
    JanalyticsPlugin.registerWith(registry.registrarFor("com.jiguang.janalytics.JanalyticsPlugin"));
    JmessageFlutterPlugin.registerWith(registry.registrarFor("com.jiguang.jmessageflutter.JmessageFlutterPlugin"));
    JPushPlugin.registerWith(registry.registrarFor("com.jiguang.jpush.JPushPlugin"));
    JverifyPlugin.registerWith(registry.registrarFor("com.jiguang.jverify.JverifyPlugin"));
    PackageInfoPlugin.registerWith(registry.registrarFor("io.flutter.plugins.packageinfo.PackageInfoPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    PermissionHandlerPlugin.registerWith(registry.registrarFor("com.baseflow.permissionhandler.PermissionHandlerPlugin"));
    ImageScannerPlugin.registerWith(registry.registrarFor("top.kikt.imagescanner.ImageScannerPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
    TencentCosPlugin.registerWith(registry.registrarFor("com.ruiyu.tencentcos.tencentcos.TencentCosPlugin"));
    ThumbnailsPlugin.registerWith(registry.registrarFor("com.asapjay.thumbnails.ThumbnailsPlugin"));
    UmengsharePlugin.registerWith(registry.registrarFor("cn.ugle.flutter.umengshare.UmengsharePlugin"));
    UrlLauncherPlugin.registerWith(registry.registrarFor("io.flutter.plugins.urllauncher.UrlLauncherPlugin"));
    WebViewFlutterPlugin.registerWith(registry.registrarFor("io.flutter.plugins.webviewflutter.WebViewFlutterPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
