import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_android/flutter_android.dart';
import 'package:flutter_android/flutter_android_platform_interface.dart';
import 'package:flutter_android/flutter_android_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterAndroidPlatform
    with MockPlatformInterfaceMixin
    implements FlutterAndroidPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterAndroidPlatform initialPlatform = FlutterAndroidPlatform.instance;

  test('$MethodChannelFlutterAndroid is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterAndroid>());
  });

  test('getPlatformVersion', () async {
    FlutterAndroid flutterAndroidPlugin = FlutterAndroid();
    MockFlutterAndroidPlatform fakePlatform = MockFlutterAndroidPlatform();
    FlutterAndroidPlatform.instance = fakePlatform;

    expect(await flutterAndroidPlugin.getPlatformVersion(), '42');
  });
}
