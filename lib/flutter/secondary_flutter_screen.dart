import 'package:flutter/material.dart';

import '../flutter_android.dart';

class SecondaryFlutterScreen extends StatelessWidget {
  SecondaryFlutterScreen(
      {super.key, required this.value1, required this.value2});

  final int value1;
  final int value2;

  final _flutterAndroidPlugin = FlutterAndroid();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secondary screen'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: TextButton(
                onPressed: () async {
                  //await _flutterAndroidPlugin.navigateBackToAndroidScreen(value1 + value2);
                  Navigator.pop(context, value1 + value2);
                },
                child: const Text(
                  'Navigate back to Android Screen',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 50.0),
          Center(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  '$value1 + $value2 = ${value1 + value2}',
                  style: const TextStyle(
                    fontSize: 30.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
