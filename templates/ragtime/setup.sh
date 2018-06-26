#!/bin/bash

RAGTIME_NAME=$1

touch ../v_$(date +%Y%m%d%H%M%S%3N)_${RAGTIME_NAME}.{up,down}.sql
