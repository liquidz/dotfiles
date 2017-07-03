#!/bin/bash

BASENAME=$(basename $(pwd))

mv CLPROJECT.asd      ${BASENAME}.asd
mv CLPROJECT-test.asd ${BASENAME}-test.asd
mv src/CLPROJECT.lisp src/${BASENAME}.lisp
mv t/CLPROJECT.lisp   t/${BASENAME}.lisp

find . -type f | xargs sed -i -e "s/CLPROJECT/${BASENAME}/g"
find . -type f | xargs sed -i -e "s/THISYEAR/$(date +%Y)/g"
