#include "include/sunmi_serial_no/sunmi_serial_no_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "sunmi_serial_no_plugin.h"

void SunmiSerialNoPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  sunmi_serial_no::SunmiSerialNoPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
