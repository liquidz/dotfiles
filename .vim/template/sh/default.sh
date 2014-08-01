#!/bin/sh

usage() {
    cat <<EOT
Usage:
EOT
}

if [ $# -ne 1 ]; then
    usage
    exit 1
fi

echo "foo ${1}"
