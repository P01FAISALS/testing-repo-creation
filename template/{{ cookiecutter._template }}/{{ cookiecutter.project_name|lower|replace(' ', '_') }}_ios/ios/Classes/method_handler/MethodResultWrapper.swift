import Flutter

class MethodResultWrapper: NSObject {
    private var methodResult: FlutterResult!
    
    func setResult(methodResult: @escaping FlutterResult) {
        self.methodResult = methodResult
    }
    
    func success(_ result: Any?) {
        DispatchQueue.main.async {
            self.methodResult(result)
        }
    }
    
    func error(_ errorCode: String, errorMessage: String?, errorDetails: Any?) {
        DispatchQueue.main.async {
            self.methodResult(FlutterError(code: errorCode, message: errorMessage, details: errorDetails))
        }
    }
    
    func notImplemented() {
        DispatchQueue.main.async {
            self.methodResult(FlutterMethodNotImplemented)
        }
    }
}
