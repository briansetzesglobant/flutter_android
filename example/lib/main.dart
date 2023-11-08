import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_android/flutter/secondary_flutter_screen.dart';
import 'package:flutter_android/flutter_android.dart';
import 'package:flutter_android/flutter/flutter_method_channel.dart';

/*void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}*/

void main(List<String> args) {
  return runApp(
    MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
              builder: (_) => const MyApp(),
            );
          case '/secondaryFlutterScreen':
            return MaterialPageRoute(
              builder: (_) => SecondaryFlutterScreen(
                  value1: args[0].isNotEmpty ? int.parse(args[0]) : 0, value2: args[1].isNotEmpty ? int.parse(args[1]) : 0),
                  //value1: (settings.arguments as Map<String, int>)['value1']!, value2: (settings.arguments as Map<String, int>)['value2']!),
            );
          default:
            return MaterialPageRoute(
              builder: (_) => const Scaffold(
                body: Center(
                  child: Text(
                    'text',
                  ),
                ),
              ),
            );
        }
      },
      /*routes: {
        '/': (context) => const MyApp(),
        '/secondaryFlutterScreen': (context) => SecondaryFlutterScreen(
            value1: args[0].isNotEmpty ? int.parse(args[0]) : 0, value2: args[1].isNotEmpty ? int.parse(args[1]) : 0),
      },*/
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _flutterAndroidPlugin = FlutterAndroid();

  @override
  void initState() {
    super.initState();
  }

  Future<void> navigateToAndroidScreen() async {
    try {
      await _flutterAndroidPlugin.navigateToAndroidScreen();
    } on PlatformException {
      print('Failed to navigate to android screen.');
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    FlutterMethodChannel.instance.configureChannel(context);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Main'),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blue),
            ),
            child: TextButton(
              onPressed: () {
                navigateToAndroidScreen();
              },
              child: const Text(
                'Navigate to Android Screen',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
