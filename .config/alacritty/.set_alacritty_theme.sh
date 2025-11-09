#!/bin/bash

ALACRITTY_CONFIG_DIR="/home/romeo/.config/alacritty"
DARK_THEME_FILE="github_dark_default.toml"
LIGHT_THEME_FILE="github_light_default.toml"
THEME_LINK="theme.toml"

# Function to set the theme
set_theme() {
    local theme_file="$1"
    if [ -L "${ALACRITTY_CONFIG_DIR}/${THEME_LINK}" ]; then
        rm "${ALACRITTY_CONFIG_DIR}/${THEME_LINK}"
    fi
    ln -s "${ALACRITTY_CONFIG_DIR}/${theme_file}" "${ALACRITTY_CONFIG_DIR}/${THEME_LINK}"
    echo "Alacritty theme set to ${theme_file}"
}

# Detect system theme (this is a common way for Gnome/GTK-based desktops)
# You might need to adjust this based on your desktop environment
# For KDE Plasma, you might check `kreadconfig5 --file kdeglobals --group General --key ColorScheme`
# For other DEs, you might need a different approach or a more generic tool like `gsettings`
if gsettings get org.gnome.desktop.interface color-scheme | grep -q 'dark'; then
    set_theme "${DARK_THEME_FILE}"
else
    set_theme "${LIGHT_THEME_FILE}"
fi
