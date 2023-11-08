package com.example.flutter_android

import android.app.Activity
import android.app.Application
import android.content.Context
import android.content.Intent
import android.os.Looper
import android.widget.Toast
import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry

/** FlutterAndroidPlugin */
class FlutterAndroidPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    PluginRegistry.ActivityResultListener {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext as Application
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_android")
        channel.setMethodCallHandler(this)
        /*FlutterEngine(context).apply {
            navigationChannel.setInitialRoute("/secondaryFlutterScreen")
            dartExecutor.executeDartEntrypoint(DartExecutor.DartEntrypoint.createDefault())
            FlutterEngineCache.getInstance().put("plugin_engine", this)
        }*/
    }

    private fun callMethod(name: String, arguments: Map<String, Any>?, resultHandler: Result? = null) {
        //print(Thread.currentThread() == Looper.getMainLooper().thread) // Si da false esta corriendo en background y hay que hacer que corra en el thread main de la UI
        channel.invokeMethod(name, arguments, resultHandler)
    }

    fun androidToFlutter(name: String, value1: Int, value2: Int, resultHandler: Result?) {
        callMethod(name, hashMapOf("value1" to value1, "value2" to value2), resultHandler)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        if (call.method == "navigateToAndroidScreen") {
            activity.startActivityForResult(Intent(context, SecondaryActivity::class.java), 123)
            result.success(null)
        }
        /*if (call.method == "navigateBackToAndroidScreen") {
            var intent : Intent = Intent(context, SecondaryActivity::class.java)
            intent.putExtra("sum", (call.arguments as Map<String, String>)["sum"])
            activity.startActivity(intent)
            result.success(null)
        }*/ else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
        binding.addActivityResultListener(this)
    }

    override fun onDetachedFromActivityForConfigChanges() {
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        return false
    }
}
