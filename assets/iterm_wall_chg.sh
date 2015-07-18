#!/bin/bash

#IMAGE_DIR="$HOME/Pictures/iterm2"
#
#IMAGE_COUNT=$(ls -1 $IMAGE_DIR | wc -l)
#IMAGE_INDEX=$(((RANDOM % $IMAGE_COUNT) + 1))
#
#IMAGE_NAME=$(ls -1 $IMAGE_DIR | head -n $IMAGE_INDEX | tail -n 1)
#IMAGE_PATH="$IMAGE_DIR/$IMAGE_NAME"
#
#/usr/bin/osascript <<EOT
#tell application "iTerm"
#  tell the current terminal
#    tell the current session
#      set background image path to "$IMAGE_PATH"
#    end tell
#  end tell
#end tell
#EOT
