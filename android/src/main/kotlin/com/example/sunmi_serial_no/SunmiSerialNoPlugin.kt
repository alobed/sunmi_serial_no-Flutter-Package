package com.example.sunmi_serial_no

import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES

import androidx.annotation.NonNull

import java.lang.reflect.Method
import android.os.Build

/** SunmiSerialNoPlugin */
class SunmiSerialNoPlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sunmi_serial_no")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }

  private fun getSN(): String {
    var serial: String? = null
    val c = Class.forName("android.os.SystemProperties")
    val get = c.getMethod("get", String::class.java)

    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
      try {
        serial = get.invoke(c, "ro.sunmi.serial") as String
      } catch (e: Exception) {
        e.printStackTrace()
      }
      return serial ?: ""
    } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      serial = Build.getSerial()
      return serial ?: ""
    } else {
      try {
        serial = get.invoke(c, "ro.serialno") as String
      } catch (e: Exception) {
        e.printStackTrace()
      }
      return serial ?: ""
    }
  }
}
