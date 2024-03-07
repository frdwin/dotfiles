#!/bin/bash
# Autostart script
# Frederico Winter (2024)
# >_ fwinter

# Start pipewire for audio
/usr/libexec/pipewire-launcher

# Start waybar
waybar

# Update dbus
dbus-update-activation-environment DISPLAY

# Set the wallpaper
swaybg -m fill -i $HOME/images/wallpapers/default
