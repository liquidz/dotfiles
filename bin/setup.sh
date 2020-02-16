#!/usr/bin/env bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
BASE_DIR=~/src/github.com/liquidz/dotfiles
if [[ "$(whoami)" = "root" ]]; then
    SUDO=''
else
    SUDO='sudo'
fi

if [[ "$(uname)" = "Linux" ]]; then
    which curl > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        ${SUDO} apt update
        ${SUDO} apt install -y curl
    fi
    which git > /dev/null 2>&1
    if [[ $? -ne 0 ]]; then
        ${SUDO} apt update
        ${SUDO} apt install -y git
    fi
fi

git clone https://github.com/liquidz/dotfiles ${BASE_DIR}

(cd ${BASE_DIR}/bin && \
    curl -L https://raw.githubusercontent.com/liquidz/dad/master/script/download | bash)

${SUDO} ${BASE_DIR}/bin/dad ${BASE_DIR}/bin/cookbooks/default.clj
