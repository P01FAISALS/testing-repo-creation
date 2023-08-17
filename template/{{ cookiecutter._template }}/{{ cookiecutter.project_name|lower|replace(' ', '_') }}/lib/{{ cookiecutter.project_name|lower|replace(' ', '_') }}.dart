import 'dart:async';

import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_interface.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface.dart';

class {{ cookiecutter.project_name|replace(' ', '') }}Plugin extends {{ cookiecutter.project_name|replace(' ', '') }} {

  // TODO: override {{ cookiecutter.project_name|replace(' ', '') }} methods
  // and call {{ cookiecutter.project_name|replace(' ', '') }}Platform.instance.<method> in them

  @override
  Future<bool> sampleMethodWithArgument({required SampleData data}) {
    return {{ cookiecutter.project_name|replace(' ', '') }}Platform.instance.sampleMethodWithArgument(data: data);
  }

  @override
  Future<Map<String, dynamic>> sampleMethod() {
    return {{ cookiecutter.project_name|replace(' ', '') }}Platform.instance.sampleMethod();
  }
}
