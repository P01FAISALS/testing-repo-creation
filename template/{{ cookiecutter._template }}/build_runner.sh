set -ex

(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface; flutter pub run build_runner build --delete-conflicting-outputs)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android; flutter pub run build_runner build --delete-conflicting-outputs)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios; flutter pub run build_runner build --delete-conflicting-outputs)
(cd test_app; flutter pub run build_runner build --delete-conflicting-outputs)