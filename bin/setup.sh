#!/usr/bin/env bash

BASE_DIR=~/src/github.com/liquidz

which mitamae > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    git clone https://github.com/liquidz/cookbooks $BASE_DIR/cookbooks
    cd $BASE_DIR/cookbooks
    sudo make
fi

if [[ ! -e $BASE_DIR/dotfiles ]]; then
    git clone https://github.com/liquidz/dotfiles $BASE_DIR/dotfiles
fi
mitamae local $BASE_DIR/dotfiles/bin/cookbooks/default.rb
