#!/bin/bash

# Get current GTK theme
current_theme=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current_theme" == "'prefer-dark'" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme 'default'
    export THEME="default"
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
    export THEME="dark"
fi
