package za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.method_handler

import io.flutter.plugin.common.MethodChannel

class MethodResultWrapper :
    MethodChannel.Result {
    lateinit var methodResult: MethodChannel.Result
    fun setResult(methodResult: MethodChannel.Result) {
        this.methodResult = methodResult
    }

    override fun success(result: Any?) {
        methodResult.success(result)
    }

    override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
        methodResult.error(
            errorCode,
            errorMessage,
            errorDetails
        )
    }

    override fun notImplemented() {
        methodResult.notImplemented()
    }
}