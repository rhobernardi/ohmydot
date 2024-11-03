# OPTIONAL_APPS=("Bitwarden" "Spotify" "Zoom" "Discord" "Dropbox")
# DEFAULT_OPTIONAL_APPS='Bitwarden'
# export OHMYDOT_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')

AVAILABLE_THEMES=("EOS" "Nord" "Tokyo-Night" "Gruvbox" "Custom")
SELECTED_THEME="Nord"
export OHMYDOT_XFCE_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$SELECTED_THEME" --height 7 --header "Select your theme")
