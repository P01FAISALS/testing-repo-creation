import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:test_app/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_widget.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}/{{ cookiecutter.project_name|lower|replace(' ', '_') }}.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_interface.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(ModularApp(module: MyModule(), child: AppWidget()));
}

class MyModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton<{{ cookiecutter.project_name|replace(' ', '') }}>((i) => {{ cookiecutter.project_name|replace(' ', '') }}Plugin()),
  ];
}

class AppWidget extends StatefulWidget {
  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('{{ cookiecutter.project_name|replace(' ', ' ') }} plugin example app'),
        ),
        body: const {{ cookiecutter.project_name|replace(' ', '') }}Widget(),
      ),
    );
  }
}
