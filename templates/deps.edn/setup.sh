#!/bin/bash

PROJECT_NAME=$1
DIR_NAME="${PROJECT_NAME//-/_}"

SRC_DIR=src/$DIR_NAME
TEST_DIR=test/$DIR_NAME

mv src/dummy $SRC_DIR
mv test/dummy $TEST_DIR

if [ "$(uname)" == 'Darwin' ]; then
    find . -type f | xargs sed -i '' -e "s/__dummy__/$PROJECT_NAME/g"
else
    find . -type f | xargs sed -i -e "s/__dummy__/$PROJECT_NAME/g"
fi
