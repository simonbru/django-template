#!/bin/sh
set -e

finish() {
    vagrant halt
}

trap finish EXIT INT

git submodule update --init


# don't delete this line, or copy that content and adjust it
. ./virtualization/drifter/ci/test-header.sh

./scripts/runtests.sh --recreate -- --numprocesses=2

# don't delete this line, or copy that content and adjust it
. ./virtualization/drifter/ci/test-footer.sh

