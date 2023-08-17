set -e

function generateCoverage {
  echo "Generating test coverage for {{ cookiecutter.project_name|replace(' ', '') }}"
  (cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android; flutter test --coverage)
  (cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android/coverage; sed -i '' "s|SF:lib/|SF:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_android/lib/|g" lcov.info)

  (cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios; flutter test --coverage)
  (cd {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios/coverage; sed -i '' "s|SF:lib/|SF:{{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios/lib/|g" lcov.info)


  echo "Combining all coverage into file://$(pwd)/all_coverage/combined-coverage.info"
  lcov --add-tracefile {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android/coverage/lcov.info --base-directory {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android/lib --no-external -d {{ cookiecutter.project_name|lower|replace(' ', '_') }}_android \
       --add-tracefile {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios/coverage/lcov.info --base-directory {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios/lib --no-external -d {{ cookiecutter.project_name|lower|replace(' ', '_') }}_ios \
       --output-file all_coverage/combined-coverage.info
  echo "Generating html file test coverage for {{ cookiecutter.project_name|replace(' ', '') }}"
  genhtml all_coverage/combined-coverage.info --output-directory all_coverage/html --show-details
  echo "Open this file file://$(pwd)/all_coverage/html/index.html"
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  if command -v lcov >/dev/null 2>&1; then
    generateCoverage
  else
    echo "lcov is not installed in mac"
    echo "Installing lcov using this command 'brew install lcov'"
    brew install lcov
    generateCoverage
  fi
elif [[ "$OSTYPE" == "msys" ]]; then
  if where lcov >/dev/null 2>&1; then
    generateCoverage
  else
    echo "lcov is not installed in windows"
    echo "Please refer to the following link for more information: https://github.com/linux-test-project/lcov."
  fi
else
  echo "Unknown operating system"
fi