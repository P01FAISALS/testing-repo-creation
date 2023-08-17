import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_android/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_android.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_dto.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_method_names.dart';
import 'package:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface/{{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface.dart';


import '{{ cookiecutter.project_name|lower|replace(' ', '_') }}_android_test.mocks.dart';

@GenerateMocks([
  MethodChannel
], customMocks: [
  MockSpec<MethodChannel>(as: #MethodChannelRelaxed),
])

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late {{ cookiecutter.project_name|replace(' ', '') }}Android {{ cookiecutter.project_name|lower|replace(' ', '') }};
  late MockMethodChannel mockChannel;

  setUp(() {
    mockChannel = MockMethodChannel();
    {{ cookiecutter.project_name|replace(' ', '') }}Platform.instance = {{ cookiecutter.project_name|lower|replace(' ', '') }} = {{ cookiecutter.project_name|replace(' ', '') }}Android();
    {{ cookiecutter.project_name|lower|replace(' ', '') }}.setChannel(mockChannel);
  });

  group('sampleMethodWithArgument', () {
    test('returns true when success is true', () async {
      final data = SampleData(data: '1234');
      final result = <String, dynamic>{'success': 'true'};
      when(mockChannel.invokeMethod(any, any)).thenAnswer((_) async => result);

      final success = await {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethodWithArgument(data: data);

      verify(mockChannel.invokeMethod({{ cookiecutter.project_name|replace(' ', '') }}MethodNames.sampleMethodWithArgument.value, {'data': data.toJsonString()}));
      expect(success, isTrue);
    });

    test('returns false when success is not true', () async {
      final data = SampleData(data: '1234');
      final result = <String, dynamic>{'success': 'false'};
      when(mockChannel.invokeMethod(any, any)).thenAnswer((_) async => result);

      final success = await {{ cookiecutter.project_name|lower|replace(' ', '') }}.sampleMethodWithArgument(data: data);

      verify(mockChannel.invokeMethod({{ cookiecutter.project_name|replace(' ', '') }}MethodNames.sampleMethodWithArgument.value, {'data': data.toJsonString()}));
      expect(success, isFalse);
    });
  });
}


