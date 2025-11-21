#!/bin/bash

# Define options
options="Power Off\nRestart\nLock\nSuspend"

# Show rofi menu
chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -theme-str 'listview { lines: 4; }')

# Execute the corresponding command
case "$chosen" in
    "Power Off") systemctl poweroff ;;
    "Restart") systemctl reboot ;;
    "Lock") i3lock ;;
    "Suspend") systemctl suspend ;;
    *) exit 1 ;;
esac
