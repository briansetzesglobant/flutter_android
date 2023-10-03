
import 'flutter_android_platform_interface.dart';

class FlutterAndroid {
  Future<String?> getPlatformVersion() {
    return FlutterAndroidPlatform.instance.getPlatformVersion();
  }
}
