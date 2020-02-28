package com.chongmeng.chongmeng

import android.content.Intent
import android.content.pm.PackageManager
import android.os.Bundle
import android.provider.Settings

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private val channel = "chongmeng"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        UpdateVersionPlugin.registerWith(registrarFor("iwubida.com/update_version"));
        initMethodChannel()
    }

    private fun initMethodChannel() {
        MethodChannel(flutterView, channel).setMethodCallHandler { call, result ->
            when (call.method) {
                "getChannel" -> {
                    result.success(try {
                        val appInfo = packageManager.getApplicationInfo(packageName, PackageManager.GET_META_DATA);
                        appInfo.metaData.getString("UMENG_CHANNEL")
                    } catch (e: PackageManager.NameNotFoundException) {
                        e.printStackTrace()
                        "error"
                    })
                }
                "openGPS" -> {
                    val intent = Intent(
                            Settings.ACTION_LOCATION_SOURCE_SETTINGS)
                    startActivity(intent)
                    result.success("")
                }
            }
        }
    }
}
