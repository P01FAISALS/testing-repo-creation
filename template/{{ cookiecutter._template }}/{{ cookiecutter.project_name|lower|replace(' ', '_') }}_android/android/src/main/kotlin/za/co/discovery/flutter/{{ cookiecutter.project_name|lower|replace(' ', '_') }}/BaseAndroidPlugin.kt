package za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}

import androidx.annotation.NonNull
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler

/**
 * The base _native_ implementation for framework plugins. Handles method channel initialisation and
 * allows calling plugins to get access to the main framework container
 */
abstract class BaseAndroidPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        Log.d(
            TAG,
            "onAttachedToEngine() called with: flutterPluginBinding = $flutterPluginBinding"
        )
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, methodChannelName())
        channel.setMethodCallHandler(this)
    }

    /**
     * The name of the method channel that the Flutter and Native bits will use to talk to each other
     */
    abstract fun methodChannelName(): String

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        Log.d(TAG, "onDetachedFromEngine() called with: binding = $binding")
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        // do nothing
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        // do nothing
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // do nothing
    }

    override fun onDetachedFromActivity() {
        // do nothing
    }
}

/**
 * extension function to provide TAG value
 */
val Any.TAG: String
    get() {
        return if (!javaClass.isAnonymousClass) {
            val name = javaClass.simpleName
            if (name.length <= 23) name else name.substring(0, 23)// first 23 chars
        } else {
            val name = javaClass.name
            if (name.length <= 23) name else name.substring(
                name.length - 23,
                name.length
            )// last 23 chars
        }
    }