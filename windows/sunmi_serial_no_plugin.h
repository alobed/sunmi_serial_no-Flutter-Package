#ifndef FLUTTER_PLUGIN_SUNMI_SERIAL_NO_PLUGIN_H_
#define FLUTTER_PLUGIN_SUNMI_SERIAL_NO_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace sunmi_serial_no {

class SunmiSerialNoPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  SunmiSerialNoPlugin();

  virtual ~SunmiSerialNoPlugin();

  // Disallow copy and assign.
  SunmiSerialNoPlugin(const SunmiSerialNoPlugin&) = delete;
  SunmiSerialNoPlugin& operator=(const SunmiSerialNoPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace sunmi_serial_no

#endif  // FLUTTER_PLUGIN_SUNMI_SERIAL_NO_PLUGIN_H_
