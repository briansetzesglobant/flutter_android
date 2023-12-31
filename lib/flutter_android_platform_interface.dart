import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_android_method_channel.dart';

abstract class FlutterAndroidPlatform extends PlatformInterface {
  /// Constructs a FlutterAndroidPlatform.
  FlutterAndroidPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterAndroidPlatform _instance = MethodChannelFlutterAndroid();

  /// The default instance of [FlutterAndroidPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterAndroid].
  static FlutterAndroidPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterAndroidPlatform] when
  /// they register themselves.
  static set instance(FlutterAndroidPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<void> navigateToAndroidScreen() {
    throw UnimplementedError('navigateToAndroidScreen() has not been implemented.');
  }

  /*Future<void> navigateBackToAndroidScreen(int sum) {
    throw UnimplementedError('navigateBackToAndroidScreen(int sum) has not been implemented.');
  }*/
}
