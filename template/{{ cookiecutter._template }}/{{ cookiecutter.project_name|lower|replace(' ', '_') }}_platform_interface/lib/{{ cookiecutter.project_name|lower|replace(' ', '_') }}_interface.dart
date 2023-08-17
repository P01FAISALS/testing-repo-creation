import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';

abstract class {{ cookiecutter.project_name|replace(' ', '') }} {
  /// TODO: this is the DI interface that the main implementation will implement
  /// Duplicate all the plattform interface methods here

  Future<bool> sampleMethodWithArgument({required SampleData data});

  Future<Map<String, dynamic>> sampleMethod();
}
