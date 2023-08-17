package za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.native_sdk

import android.content.Context
import android.util.Log
import za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.method_handler.MethodResultWrapper

class {{ cookiecutter.project_name|replace(' ', '') }}(val context: Context) {

  init {
    Log.d("{{ cookiecutter.project_name|replace(' ', '') }}", "Initialization")
    // TODO add initialization of native SDK here
  }

  fun sampleMethodWithArgument(data: String, result: MethodResultWrapper) {
    // TODO call SDK method here

    // Simulation of callback: instead of calling this method here, call it on delegate/protocol from native SDK.
    val responseDict = HashMap<String, Any>()
    responseDict["status"] = 200
    responseDict["message"] = "sampleMethodWithArgument: OK from android $data"

    result.success(responseDict)
  }

  fun sampleMethod(result: MethodResultWrapper) {
    // TODO call SDK method here
    val responseDict = HashMap<String, Any>()
    responseDict["status"] = 200
    responseDict["message"] = "sampleMethod: OK from android"
    result.success(responseDict)
  }
}