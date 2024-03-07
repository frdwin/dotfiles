#!/bin/bash
# Frederico Winter (2024)
# >_ fwinter

killall waybar
notify-send "Killed Waybar"
waybar &
notify-send "Restarted Waybar"
