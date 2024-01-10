//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <sunmi_serial_no/sunmi_serial_no_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) sunmi_serial_no_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "SunmiSerialNoPlugin");
  sunmi_serial_no_plugin_register_with_registrar(sunmi_serial_no_registrar);
}
