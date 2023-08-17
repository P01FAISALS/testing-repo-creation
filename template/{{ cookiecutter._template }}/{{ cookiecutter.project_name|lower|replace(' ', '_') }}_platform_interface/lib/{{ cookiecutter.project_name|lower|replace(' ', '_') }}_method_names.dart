enum {{ cookiecutter.project_name|replace(' ', '') }}MethodNames {
  sampleMethod('sampleMethod'),
  sampleMethodWithArgument('sampleMethodWithArgument');

  final String value;

  const {{ cookiecutter.project_name|replace(' ', '') }}MethodNames(this.value);

  String get valueGetter {
    return value;
  }

  static {{ cookiecutter.project_name|replace(' ', '') }}MethodNames valueOf({required value}) {
    switch (value) {
      case "sampleMethod":
        return {{ cookiecutter.project_name|replace(' ', '') }}MethodNames.sampleMethod;
      case "sampleMethodWithArgument":
        return {{ cookiecutter.project_name|replace(' ', '') }}MethodNames.sampleMethodWithArgument;
      default:
        throw Exception("Unknown {{ cookiecutter.project_name|replace(' ', '') }}MethodNames");
    }
  }
}