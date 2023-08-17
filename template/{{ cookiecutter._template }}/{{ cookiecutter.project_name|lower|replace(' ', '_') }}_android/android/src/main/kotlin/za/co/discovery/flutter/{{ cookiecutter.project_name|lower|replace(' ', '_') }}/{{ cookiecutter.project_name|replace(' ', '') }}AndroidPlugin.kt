package za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}

import android.os.Handler
import android.os.Looper
import androidx.annotation.NonNull

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel.Result
import za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.method_handler.MethodResultWrapper
import za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.method_handler.MethodRunner
import za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.native_sdk.{{ cookiecutter.project_name|replace(' ', '') }}

/** Avoid to remove this, it is required to use the Flutter Embedding V2 Capability*/
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** {{ cookiecutter.project_name|replace(' ', '') }}AndroidPlugin */
class {{ cookiecutter.project_name|replace(' ', '') }}AndroidPlugin : BaseAndroidPlugin() {

  private val handler: Handler = Handler(Looper.getMainLooper())

  override fun methodChannelName(): String = channelName

  companion object {
    const val channelName = "{{ cookiecutter.project_name|lower|replace(' ', '_') }}"
  }

  private val resultWrapper = MethodResultWrapper()
  private lateinit var methodRunner: MethodRunner

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    super.onAttachedToActivity(binding)

    val {{ cookiecutter.project_name|lower|replace(' ', '') }} = {{ cookiecutter.project_name|replace(' ', '') }}(binding.activity)
    methodRunner = MethodRunner({{ cookiecutter.project_name|lower|replace(' ', '') }})
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    resultWrapper.setResult(result)
    methodRunner.setup(call, resultWrapper)
    handler.post(methodRunner)
  }
}

