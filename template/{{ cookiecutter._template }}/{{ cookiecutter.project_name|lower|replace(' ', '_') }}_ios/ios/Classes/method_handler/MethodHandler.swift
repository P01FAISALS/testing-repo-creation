import Foundation

class MethodHandler {
    private let {{ cookiecutter.project_name|lower|replace(' ', '') }}: {{ cookiecutter.project_name|replace(' ', '') }}

    init({{ cookiecutter.project_name|lower|replace(' ', '') }}: {{ cookiecutter.project_name|replace(' ', '') }}) {
        self.{{ cookiecutter.project_name|lower|replace(' ', '') }} = {{ cookiecutter.project_name|lower|replace(' ', '') }}
    }

    func execute(call: FlutterMethodCall, result: MethodResultWrapper) {
        switch call.method {
        case MethodNames.sampleMethodWithArgument.rawValue:
            let rawUserData = (call.arguments as? [String : Any?])?["sampleData"] as? String ?? ""

//            TODO: Parse the string data into SampleData Class Object using codable or other parsing, rawUserData passed to sampleMethodWithArgument is just for template

            {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethodWithArgument(data: rawUserData, result: result)
        case MethodNames.sampleMethod.rawValue:
            {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethod(result: result)
        default:
            result.notImplemented()
        }
    }
}
