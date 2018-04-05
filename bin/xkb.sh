#!/bin/sh

xkbcomp -I$HOME/.xkb ~/.xkb/keymap/myxkb $DISPLAY 2> /dev/null
