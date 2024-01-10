import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'sunmi_serial_no_method_channel.dart';

abstract class SunmiSerialNoPlatform extends PlatformInterface {
  /// Constructs a SunmiSerialNoPlatform.
  SunmiSerialNoPlatform() : super(token: _token);

  static final Object _token = Object();

  static SunmiSerialNoPlatform _instance = MethodChannelSunmiSerialNo();

  /// The default instance of [SunmiSerialNoPlatform] to use.
  ///
  /// Defaults to [MethodChannelSunmiSerialNo].
  static SunmiSerialNoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SunmiSerialNoPlatform] when
  /// they register themselves.
  static set instance(SunmiSerialNoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
