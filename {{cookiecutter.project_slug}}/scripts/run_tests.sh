#!/bin/bash

# don't delete this line, or copy that content and adjust it
. ./virtualization/drifter/ci/test-header.sh


## Environment
export DATABASE_URL=postgresql://{{ cookiecutter.project_slug }}:{{ cookiecutter.project_slug }}@localhost/{{ cookiecutter.project_slug }}
export DJANGO_SETTINGS_MODULE={{ cookiecutter.project_slug }}.config.settings.test

## Tests
# Let all test commands run but record any failure
set +e
test_failure=0
trap "test_failure=1" ERR

echo Running pytest -n2 {{ cookiecutter.project_slug }} "${@}"
pytest -n2 {{ cookiecutter.project_slug }} "${@}"
scripts/check_migrations.sh
flake8 {{ cookiecutter.project_slug }}

# End of tests
set -e
trap - ERR


# don't delete this line, or copy that content and adjust it
. ./virtualization/drifter/ci/test-footer.sh


if [[ "$test_failure" != 0 ]]; then
    echo "- Failure of one test or more"
    exit 1
fi
