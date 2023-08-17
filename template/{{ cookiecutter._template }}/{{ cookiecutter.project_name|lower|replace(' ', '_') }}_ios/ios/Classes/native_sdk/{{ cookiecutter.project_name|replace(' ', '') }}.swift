import Foundation

class {{ cookiecutter.project_name|replace(' ', '') }} {

    init() {
        print("{{ cookiecutter.project_name|replace(' ', '') }} Initialization")
        // TODO: Add initialization of native SDK here
    }

    func sampleMethodWithArgument(data: String, result: MethodResultWrapper) {
        // TODO: Call SDK method here

        // Simulation of callback: instead of calling this method here, call it on delegate/protocol from native SDK.
        var responseDict = Dictionary<String, Any>()
        responseDict["status"] = 200
        responseDict["message"] = "sampleMethodWithArgument: OK from iOS \(data)"

        result.success(responseDict)
    }

    func sampleMethod(result: MethodResultWrapper) {
        // TODO: Call SDK method here
        var responseDict = Dictionary<String, Any>()
        responseDict["status"] = 200
        responseDict["message"] = "sampleMethod: OK from iOS"
        result.success(responseDict)
    }
}
