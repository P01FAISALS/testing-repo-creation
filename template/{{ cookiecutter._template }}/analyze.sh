set -ex

(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface; flutter analyze)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android; flutter analyze)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios; flutter analyze)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}; flutter analyze)