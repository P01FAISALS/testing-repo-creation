import Flutter
import UIKit

public class Swift{{ cookiecutter.project_name|replace(' ', '') }}IosPlugin: NSObject, FlutterPlugin {
    
    private var handler: MethodHandler!
    private var resultWrapper = MethodResultWrapper()
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "{{ cookiecutter.project_name|lower|replace(' ', '_') }}", binaryMessenger: registrar.messenger())
        let instance = Swift{{ cookiecutter.project_name|replace(' ', '') }}IosPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
        
        let {{ cookiecutter.project_name|lower|replace(' ', '') }} = {{ cookiecutter.project_name|replace(' ', '') }}()
        instance.handler = MethodHandler({{ cookiecutter.project_name|lower|replace(' ', '') }}: {{ cookiecutter.project_name|lower|replace(' ', '') }})
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        resultWrapper.setResult(methodResult: result)
        handler.execute(call: call, result: resultWrapper)
    }

}
