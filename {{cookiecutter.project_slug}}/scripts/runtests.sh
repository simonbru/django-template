#!/bin/sh -e
cd "$(dirname "$0")/.."  # project repo
mkdir -p .tox
pipenv lock -r --dev --keep-outdated > .tox/requirements-test.txt
pipenv run tox "${@}"
