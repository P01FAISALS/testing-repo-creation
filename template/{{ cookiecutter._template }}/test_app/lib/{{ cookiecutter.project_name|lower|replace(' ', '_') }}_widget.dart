import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_interface.dart';

class {{ cookiecutter.project_name|replace(' ', '') }}Widget extends StatefulWidget {
  const {{ cookiecutter.project_name|replace(' ', '') }}Widget({super.key});

  @override
  State<{{ cookiecutter.project_name|replace(' ', '') }}Widget> createState() => _{{ cookiecutter.project_name|replace(' ', '') }}WidgetState();
}

class _{{ cookiecutter.project_name|replace(' ', '') }}WidgetState extends State<{{ cookiecutter.project_name|replace(' ', '') }}Widget> {
  Future<void> onClick() async {
    var resultString = await Modular.get<{{ cookiecutter.project_name|replace(' ', '') }}>().sampleMethod();
    print("Result sampleMethod(): $resultString");

    var resultBool = await Modular.get<{{ cookiecutter.project_name|replace(' ', '') }}>()
        .sampleMethodWithArgument(data: SampleData(data: "Data 1234"));
    print("Result sampleMethodWithArgument(): $resultBool");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: create a basic widget to put your new plugin through its paces before integration
    return Center(
      child: TextButton(
        onPressed: onClick,
        child: const Text('Click to test Native Methods'),
      ),
    );
  }
}
