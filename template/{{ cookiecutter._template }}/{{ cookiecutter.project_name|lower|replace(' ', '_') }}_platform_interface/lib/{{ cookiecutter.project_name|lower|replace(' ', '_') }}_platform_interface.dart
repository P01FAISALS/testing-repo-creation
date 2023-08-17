library {{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface;

import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/unimplemented_{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform.dart';

abstract class {{ cookiecutter.project_name|replace(' ', '') }}Platform extends PlatformInterface {
  {{ cookiecutter.project_name|replace(' ', '') }}Platform() : super(token: _token);

  static {{ cookiecutter.project_name|replace(' ', '') }}Platform _instance = Unimplemented{{ cookiecutter.project_name|replace(' ', '') }}Platform();

  static final Object _token = Object();

  static {{ cookiecutter.project_name|replace(' ', '') }}Platform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [{{ cookiecutter.project_name|replace(' ', '') }}Platform] when they register themselves.
  static set instance({{ cookiecutter.project_name|replace(' ', '') }}Platform instance) {
    PlatformInterface.verify(instance, _token);
    _instance = instance;
  }

  /// TODO: this is the shared interface that all platform implementations will implement
  /// Put all those methods here

  Future<bool> sampleMethodWithArgument({required SampleData data});

  Future<Map<String, dynamic>> sampleMethod();
}