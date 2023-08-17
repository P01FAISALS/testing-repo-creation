Pod::Spec.new do |s|
  s.name             = '{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios'
  s.version          = '0.0.1'
  s.summary          = 'Native implementation for Flutter {{ cookiecutter.project_name }}.'
  s.description      = <<-DESC
        This project is the native iOS counterpart for the Flutter {{ cookiecutter.project_name }} lib and handles all relevant requests coming from Dart.
  DESC
  s.homepage         = 'https://github.com/discovery-ltd/{{ cookiecutter.project_name|lower|replace(' ', '-') }}'
  s.license          = { file: '../../LICENSE' }
  s.author           = { 'Mobile App Team' => 'Mobile_App_Team@discovery.co.za' }
  s.source           = { path: '.' }
  s.source_files = 'Classes/**/*'

  s.platform = :ios, '14.0'
  s.swift_versions = ['5.0', '5.1', '5.2', '5.3', '5.4', '5.5']

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

  s.test_spec 'Tests' do |test_spec|
    test_spec.source_files = 'TestClasses/**/*'
  end

  s.dependency 'Flutter'
end
