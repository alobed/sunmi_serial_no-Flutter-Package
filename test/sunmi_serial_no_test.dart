import 'package:flutter_test/flutter_test.dart';
import 'package:sunmi_serial_no/sunmi_serial_no.dart';
import 'package:sunmi_serial_no/sunmi_serial_no_platform_interface.dart';
import 'package:sunmi_serial_no/sunmi_serial_no_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSunmiSerialNoPlatform
    with MockPlatformInterfaceMixin
    implements SunmiSerialNoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final SunmiSerialNoPlatform initialPlatform = SunmiSerialNoPlatform.instance;

  test('$MethodChannelSunmiSerialNo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSunmiSerialNo>());
  });

  test('getPlatformVersion', () async {
    SunmiSerialNo sunmiSerialNoPlugin = SunmiSerialNo();
    MockSunmiSerialNoPlatform fakePlatform = MockSunmiSerialNoPlatform();
    SunmiSerialNoPlatform.instance = fakePlatform;

    expect(await sunmiSerialNoPlugin.getPlatformVersion(), '42');
  });
}
