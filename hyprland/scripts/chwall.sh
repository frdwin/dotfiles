#!/bin/bash
# Frederico Winter (2024)
# >_ fwinter

source $HOME/dotfiles/hyprland/scripts/auxfunc.sh

all_wp="$HOME/images/wallpapers"
wp=$(ls $all_wp | wofi -d -p 'Choose the wallpaper:')

if [ $wp ]; then
	swww img "$all_wp/$wp" \
		--transition-bezier .43,1.19,1,.4 \
		--transition-fps=60 \
	    --transition-type=grow \
		--transition-duration=1.0 \
		--transition-pos "$(hyprctl cursorpos)"
	notify-send "Wallpaper changed: $wp"
else
	err_n_exit "Could not found $all_wp/$wp"
fi
