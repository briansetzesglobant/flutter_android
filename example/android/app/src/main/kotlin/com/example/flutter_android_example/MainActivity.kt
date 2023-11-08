package com.example.flutter_android_example

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    /*private val nameChannel = "flutter_android"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val flutterToAndroid =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, nameChannel)
        flutterToAndroid.setMethodCallHandler { call, result ->
            if (call.method == "navigateToAndroidScreen") {
                val intent : Intent = Intent(context, SecondaryActivity::class.java)
                startActivity(intent)
                result.success(null)
            } else {
                result.notImplemented()
            }
        }
    }*/
}
