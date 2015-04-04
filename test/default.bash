#!/bin/bash

WORKSPACE_NAME=".workspace"

export_default_env () {
    if [[ "$TEST_ROOT" = "" ]]; then
        exit 1
    fi
    export TEST_PREFIX="$TEST_ROOT/$WORKSPACE_NAME"
    export PREFIX="$TEST_PREFIX"
    export IS_TEST="TRUE"
    export SETUP="bash ./bin/setup.sh"
}

initialize () {
    if [[ -e $TEST_PREFIX ]]; then
        rm -rf $TEST_PREFIX
    fi
    mkdir -p $TEST_PREFIX
}
