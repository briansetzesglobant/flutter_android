
import 'flutter_android_platform_interface.dart';

class FlutterAndroid {
  Future<String?> getPlatformVersion() {
    return FlutterAndroidPlatform.instance.getPlatformVersion();
  }

  Future<void> navigateToAndroidScreen() {
    return FlutterAndroidPlatform.instance.navigateToAndroidScreen();
  }

  /*Future<void> navigateBackToAndroidScreen(int sum) {
    return FlutterAndroidPlatform.instance.navigateBackToAndroidScreen(sum);
  }*/
}
