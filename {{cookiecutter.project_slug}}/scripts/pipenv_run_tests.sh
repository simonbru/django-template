#!/bin/sh
cd "$(dirname "$0")"/..
exec pipenv run test "${@}"
