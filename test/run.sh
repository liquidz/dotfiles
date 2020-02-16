#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)

${SCRIPT_DIR}/../bin/setup.sh

${SCRIPT_DIR}/../bin/dad --dry-run ${SCRIPT_DIR}/../bin/cookbooks/default.clj | grep "will change"
if [[ $? -ne 1 ]]; then
    echo 'Failed to setting up.'
    exit 1
fi

exit 0
