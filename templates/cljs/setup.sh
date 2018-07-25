#!/bin/bash

PROJECT_NAME=$1

lein new figwheel ${PROJECT_NAME}

mv ${PROJECT_NAME}/* .
mv ${PROJECT_NAME}/.gitignore .
rmdir ${PROJECT_NAME}
