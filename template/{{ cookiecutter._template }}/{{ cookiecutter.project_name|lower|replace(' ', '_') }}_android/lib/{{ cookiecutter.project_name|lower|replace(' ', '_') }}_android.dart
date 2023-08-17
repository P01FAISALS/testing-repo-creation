import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_method_names.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';

class {{ cookiecutter.project_name|replace(' ', '') }}Android extends {{ cookiecutter.project_name|replace(' ', '') }}Platform {
  static MethodChannel _channel = const MethodChannel('{{ cookiecutter.project_name|lower|replace(' ', '_') }}');

  static void registerWith() {
      {{ cookiecutter.project_name|replace(' ', '') }}Platform.instance = {{ cookiecutter.project_name|replace(' ', '') }}Android();
  }

  // TODO add Android-specific invocations of the {{ cookiecutter.project_name|replace(' ', '') }}Platform here

  @override
  Future<bool> sampleMethodWithArgument({required SampleData data}) async {
    Map<String, dynamic> arguments = <String, dynamic>{};
    arguments.putIfAbsent('sampleData', () => data.toJsonString());
  
    try {
      var result = await _channel.invokeMethod({{ cookiecutter.project_name|replace(' ', '') }}MethodNames.sampleMethodWithArgument.value, arguments);
      print ("$result");
      return true;
    } on PlatformException catch (ex) {
      if (kDebugMode) {
        print("PlatformException: $ex");
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
      print("Exception: $e");
    }
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> sampleMethod() async {
    var result = await _channel.invokeMethod<Map<dynamic, dynamic>>({{ cookiecutter.project_name|replace(' ', '') }}MethodNames.sampleMethod.value);

    return result?.cast<String, dynamic>() ?? {};
  }

  @visibleForTesting
  void setChannel(MethodChannel channel) {
    _channel = channel;
  }
}

