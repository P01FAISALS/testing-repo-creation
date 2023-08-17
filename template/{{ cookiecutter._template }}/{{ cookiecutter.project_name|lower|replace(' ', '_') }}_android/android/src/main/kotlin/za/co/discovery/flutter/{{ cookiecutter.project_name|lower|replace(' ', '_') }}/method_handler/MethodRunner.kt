package za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.method_handler

import za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.native_sdk.{{ cookiecutter.project_name|replace(' ', '') }}
import io.flutter.plugin.common.MethodCall

class MethodRunner(
    private val {{ cookiecutter.project_name|lower|replace(' ', '') }}: {{ cookiecutter.project_name|replace(' ', '') }}
) : Runnable {

    private lateinit var call: MethodCall
    private lateinit var result: MethodResultWrapper
    fun setup(call: MethodCall,
              result: MethodResultWrapper) {
        this.call = call
        this.result = result
    }
    override fun run() {
        when (call.method) {
            MethodNames.SampleMethodWithArgument.value -> {
                val rawUserData = call.argument<String>("sampleData") ?: ""

//                TODO: Sample -> Parse the string data into SampleData Class, rawUserData passed to sampleMethodWithArgument is just for template
//                val userData = Gson().fromJson(rawUserData, SampleData::class.java)
//                if (userData != null) {
//                    {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethodWithArgument(rawUserData)
//                    result?.success(true)
//                } else {
//                    result.error("-100", "Parameter [user_data] is required", null)
//                }
                {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethodWithArgument(rawUserData, result)
            }
            MethodNames.SampleMethod.value -> {
                {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethod(result)
            }
            else -> result.notImplemented()
        }
    }
}