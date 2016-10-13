#!/bin/bash

url='https://duckduckgo.com?q'

cat <<_END_
Content-type: text/plain
W3m-control: PREV
W3m-control: TAB_GOTO $url=$QUERY_STRING

_END_
