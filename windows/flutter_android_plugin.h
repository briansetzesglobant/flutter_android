#ifndef FLUTTER_PLUGIN_FLUTTER_ANDROID_PLUGIN_H_
#define FLUTTER_PLUGIN_FLUTTER_ANDROID_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace flutter_android {

class FlutterAndroidPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  FlutterAndroidPlugin();

  virtual ~FlutterAndroidPlugin();

  // Disallow copy and assign.
  FlutterAndroidPlugin(const FlutterAndroidPlugin&) = delete;
  FlutterAndroidPlugin& operator=(const FlutterAndroidPlugin&) = delete;

 private:
  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace flutter_android

#endif  // FLUTTER_PLUGIN_FLUTTER_ANDROID_PLUGIN_H_
