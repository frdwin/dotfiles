#!/bin/bash
# Frederico Winter (2024)
# >_ fwinter

source "$HOME/dotfiles/hyprland/scripts/auxfunc.sh"

LOCK="/usr/bin/swaylock"
TOGGLE_MONITOR="/usr/bin/hyprctl dispatch dpms"
TIMEOUT_LOCK=300
TIMEOUT_MONITOR=600

if [ -f "/usr/bin/swayidle" ] && [ -f "/usr/bin/swaylock" ] && [ -f "/usr/bin/hyprctl" ]; then
    /usr/bin/swayidle -w timeout $TIMEOUT_LOCK "$LOCK" \
	    timeout $TIMEOUT_MONITOR "$TOGGLE_MONITOR off" \
	    resume "$TOGGLE_MONITOR on"
else
    error_n_exit "swayidle, swaylock or hyprctl was not found."
fi
