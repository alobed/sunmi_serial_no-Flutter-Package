import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'sunmi_serial_no_platform_interface.dart';

/// An implementation of [SunmiSerialNoPlatform] that uses method channels.
class MethodChannelSunmiSerialNo extends SunmiSerialNoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('sunmi_serial_no');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
