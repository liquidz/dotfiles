#!/usr/bin/env bash

which mitamae > /dev/null 2>&1
if [[ $? -ne 0 ]]; then
    git clone https://github.com/liquidz/cookbooks ~/src/github.com/liquidz/cookbooks
    cd ~/src/github.com/liquidz/cookbooks
    sudo make
fi

mitamae local cookbooks/default.rb
