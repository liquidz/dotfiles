#!/bin/bash

BASENAME=$(basename $(pwd))

mv CLPROJECT.asd ${BASENAME}.asd
find . -type f | xargs sed -i -e "s/CLPROJECT/${BASENAME}/g"
find . -type f | xargs sed -i -e "s/THISYEAR/$(date +%Y)/g"
