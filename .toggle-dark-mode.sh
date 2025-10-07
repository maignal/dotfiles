#!/bin/bash

# Get current GTK theme
current_theme=$(gsettings get org.gnome.desktop.interface color-scheme)

if [[ "$current_theme" == "'prefer-dark'" ]]; then
    gsettings set org.gnome.desktop.interface color-scheme 'default'
#    gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-light'
else
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
#    gsettings set org.gnome.shell.ubuntu color-scheme 'prefer-dark'
fi
