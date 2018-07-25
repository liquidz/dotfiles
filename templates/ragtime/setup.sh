#!/bin/bash

RAGTIME_NAME=$1
CURRENT_TIME=$(date +%Y%m%d%H%M%S%3N)

touch ../v_${CURRENT_TIME}_${RAGTIME_NAME}.{up,down}.sql
