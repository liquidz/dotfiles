#!/bin/bash

RAGTIME_NAME=$1

if [ "$(uname)" == 'Darwin' ]; then
    CURRENT_TIME=$(date +%Y%m%d%H%M%S000)
else
    CURRENT_TIME=$(date +%Y%m%d%H%M%S%3N)
fi

touch ../v_${CURRENT_TIME}_${RAGTIME_NAME}.{up,down}.sql
