set -ex

(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_platform_interface; flutter clean)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android; flutter clean)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios; flutter clean)
(cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}; flutter clean)
(cd test_app; flutter clean)