import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_android/flutter/secondary_flutter_screen.dart';

class FlutterMethodChannel {
  static const channelName = 'flutter_android';

  late MethodChannel channel;
  late BuildContext context;

  static final FlutterMethodChannel instance = FlutterMethodChannel._init();

  FlutterMethodChannel._init();

  void configureChannel(BuildContext buildContext) {
    context = buildContext;
    channel = const MethodChannel(channelName);
    channel.setMethodCallHandler(_methodHandler);
  }

  Future<dynamic> _methodHandler(MethodCall call) async {
    switch (call.method) {
      case 'navigateAndroidToFlutter':
        int value1 = call.arguments['value1'];
        int value2 = call.arguments['value2'];
        /*Future<int> sum = await Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) =>
                  SecondaryFlutterScreen(value1: value1, value2: value2)),
        );*/
        int? sum = await Navigator.of(context).pushNamed(
            '/secondaryFlutterScreen', arguments: {'value1': value1, 'value2': value2});
        return sum;
      default:
        return Future.error("No such method '${call.method}'");
    }
  }
}
