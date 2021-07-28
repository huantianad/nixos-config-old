#!/bin/bash

W=$(xdotool getactivewindow)
S=$(xprop -id "$W" | awk '/WM_CLASS/{print $4}')

if [ "$S" = '"discord"' ] || [ "$S" = '"dolphin"' ]; then
    xdotool key --clearmodifiers alt+Right
else
    sleep 0.12
    xdotool click --window "$W" 9
fi

