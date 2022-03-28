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

if [[ -e ${SCRIPT_DIR}/cookbooks ]]; then
    ### Local test
    if [[ ! -e ${SCRIPT_DIR}/dad ]]; then
        (cd ${SCRIPT_DIR} && \
            curl -L https://raw.githubusercontent.com/liquidz/dad/main/script/download | bash)
    fi
    ${SCRIPT_DIR}/dad ${SCRIPT_DIR}/../setup.clj
else
    if [[ ! -d ${BASE_DIR} ]]; then
        git clone https://github.com/liquidz/dotfiles ${BASE_DIR}
    fi

    if [[ ! -e ${BASE_DIR}/bin/dad ]]; then
        (cd ${BASE_DIR}/bin && \
            curl -L https://raw.githubusercontent.com/liquidz/dad/main/script/download | bash)
    fi

    ${BASE_DIR}/bin/dad ${BASE_DIR}/setup.clj
fi

