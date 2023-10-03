import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_android_platform_interface.dart';

/// An implementation of [FlutterAndroidPlatform] that uses method channels.
class MethodChannelFlutterAndroid extends FlutterAndroidPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_android');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
