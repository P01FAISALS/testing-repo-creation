import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';

import '{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface.dart';

class Unimplemented{{ cookiecutter.project_name|replace(' ', '') }}Platform extends {{ cookiecutter.project_name|replace(' ', '') }}Platform {

  /*
    TODO: this is the default unimplemented version of the TokenSessionPlatform

    Simply implement each method with
    throw UnimplementedError();
     */

  @override
  Future<Map<String, dynamic>> sampleMethod() {
    throw UnimplementedError();
  }

  @override
  Future<bool> sampleMethodWithArgument({required SampleData data}) {
    throw UnimplementedError();
  }
}