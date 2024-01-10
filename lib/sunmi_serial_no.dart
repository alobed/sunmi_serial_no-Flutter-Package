
import 'sunmi_serial_no_platform_interface.dart';

class SunmiSerialNo {
  Future<String?> getPlatformVersion() {
    return SunmiSerialNoPlatform.instance.getPlatformVersion();
  }
}
