package com.example.flutter_android

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import com.example.flutter_android.databinding.ActivitySecondaryBinding
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.android.FlutterView
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.FlutterEngineCache
import io.flutter.embedding.engine.dart.DartExecutor
import io.flutter.plugin.common.MethodChannel

private lateinit var binding: ActivitySecondaryBinding
private val flutterAndroidPlugin: FlutterAndroidPlugin = FlutterAndroidPlugin()

class SecondaryActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //binding = ActivitySecondaryBinding.inflate(layoutInflater)
        setContentView(R.layout.activity_secondary)
        var flutterEngine: FlutterEngine = FlutterEngine(this)
        /*flutterEngine.dartExecutor.executeDartEntrypoint(
            DartExecutor.DartEntrypoint.createDefault()
        )
        FlutterEngineCache
            .getInstance()
            .put("my_engine_id", flutterEngine)*/

        var plugin =
            flutterEngine.plugins.get(FlutterAndroidPlugin::class.java) as FlutterAndroidPlugin

        //binding.button.setOnClickListener {}

        val button = findViewById<Button>(R.id.button)
        val editText1 = findViewById<EditText>(R.id.editText1)
        val editText2 = findViewById<EditText>(R.id.editText2)

        /*intent.getStringExtra("sum")?.let {
            Toast.makeText(applicationContext, it, Toast.LENGTH_LONG).show()
        }*/

        button.setOnClickListener {
            Toast.makeText(this, "hola", Toast.LENGTH_LONG).show()
            val resultHandler = object : MethodChannel.Result {
                override fun success(result: Any?) {
                    val sum = result as Int?
                    Toast.makeText(applicationContext, "$sum", Toast.LENGTH_LONG).show()
                }

                override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {}
                override fun notImplemented() {}
            }
            val value1 =
                if (editText1.text.toString().isNotEmpty()) editText1.text.toString().toInt() else 0
            val value2 =
                if (editText2.text.toString().isNotEmpty()) editText2.text.toString().toInt() else 0
            plugin.androidToFlutter(name = "navigateAndroidToFlutter", value1, value2, resultHandler)

            /*val intent = FlutterActivity
                .withCachedEngine("plugin_engine")
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .build(applicationContext)
            startActivity(intent)*/

            /*val intentNewEngine = FlutterActivity
                .withNewEngine()
                .initialRoute("/secondaryFlutterScreen")
                .dartEntrypointArgs(mutableListOf(value1.toString(), value2.toString()))
                .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
                .build(applicationContext)
            startActivity(intentNewEngine)*/

            /*val flutterIntent = Intent(this, FlutterActivity::class.java)
            intent.setAction(Intent.ACTION_RUN);
            intent.putExtra("route", "/secondaryFlutterScreen");
            intent.putExtra("four", value1)
            intent.putExtra("five", value2)
            startActivity(flutterIntent)*/

            /*startActivity(FlutterActivity.withCachedEngine("my_engine_id").build(this)).run {
                MethodChannel(
                    flutterEngine.dartExecutor.binaryMessenger,
                    "flutter_android"
                ).invokeMethod(
                    "navigateAndroidToFlutter",
                    hashMapOf("value1" to value1, "value2" to value2), resultHandler
                )
            }*/
        }
    }
}