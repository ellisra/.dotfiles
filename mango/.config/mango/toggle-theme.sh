#!/usr/bin/env bash

STATE="$HOME/.cache/theme-mode"

if [ "$(cat "$STATE" 2>/dev/null)" = "light" ]; then
    echo "dark" > "$STATE"

    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'

    notify-send "Set dark theme"
else
    echo "light" > "$STATE"

    gsettings set org.gnome.desktop.interface color-scheme 'default'
    gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita'

    notify-send "Set light theme"
fi
