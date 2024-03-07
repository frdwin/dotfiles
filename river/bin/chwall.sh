#!/bin/bash
# Frederico Winter (2024)
# >_ fwinter

source $HOME/dotfiles/bin/auxfunc.sh

all_wp="$HOME/images/wallpapers"
wp=$(ls $all_wp | tofi --prompt-text 'Choose the wallpaper:')

if [ $wp ]; then
	swaybg -m 'fill' -i "$all_wp/$wp"
	notify-send "Wallpaper changed: $wp"
else
	err_n_exit "Could not found $all_wp/$wp"
fi
