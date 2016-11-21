#!/bin/bash

VERSION=1.0.0
URL="https://github.com/k0kubun/mitamae/releases/download/v${VERSION}/mitamae-x86_64-linux"
TARGET=~/bin/mitamae

if [[ ! -e $TARGET ]]; then
    curl -o ~/bin/mitamae -L $URL
    chmod +x $TARGET
fi

