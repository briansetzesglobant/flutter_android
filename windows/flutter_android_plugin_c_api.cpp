#include "include/flutter_android/flutter_android_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "flutter_android_plugin.h"

void FlutterAndroidPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  flutter_android::FlutterAndroidPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
