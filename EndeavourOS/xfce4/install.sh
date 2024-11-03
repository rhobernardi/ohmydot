#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

OHMYDOT_PATH="$HOME/.local/share/ohmydot/EndeavourOS/xfce4"
export OHMYDOT_PATH

# Desktop software and tweaks will only be installed if we're running Gnome
RUNNING_XFCE=$([[ "$XDG_CURRENT_DESKTOP" == *"XFCE"* ]] && echo true || echo false)

# Check the distribution name and version and abort if incompatible
source $OHMYDOT_PATH/install/modules/terminal/gum.sh >/dev/null

if $RUNNING_XFCE; then
    # Ensure computer doesn't go to sleep or lock while installing
    xset s off
    # Disable hardware bell
    xset -b

    echo "Get ready to chose your theme..."
    source $OHMYDOT_PATH/install/first-run-choices.sh
    echo "Installing terminal and desktop tools..."
else
    echo "Only installing terminal tools..."
fi

# Install terminal tools
source $OHMYDOT_PATH/install/install_modules.sh
if $RUNNING_XFCE; then
    # Install desktop tools and tweaks
    source $OHMYDOT_PATH/install/apply_theme.sh $OHMYDOT_XFCE_THEME

    # Revert to normal idle and lock settings
    xset s on
fi
