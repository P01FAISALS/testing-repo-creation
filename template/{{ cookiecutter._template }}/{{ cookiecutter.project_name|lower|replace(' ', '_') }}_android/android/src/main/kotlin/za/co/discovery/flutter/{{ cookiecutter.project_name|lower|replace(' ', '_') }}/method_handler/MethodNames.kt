package za.co.discovery.flutter.{{ cookiecutter.project_name|lower|replace(' ', '_') }}.method_handler

enum class MethodNames(val value: String) {
    SampleMethodWithArgument("sampleMethodWithArgument"),
    SampleMethod("sampleMethod");
}