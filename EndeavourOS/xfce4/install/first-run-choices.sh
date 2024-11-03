# OPTIONAL_APPS=("Bitwarden" "Spotify" "Zoom" "Discord" "Dropbox")
# DEFAULT_OPTIONAL_APPS='Bitwarden'
# export OHMYDOT_FIRST_RUN_OPTIONAL_APPS=$(gum choose "${OPTIONAL_APPS[@]}" --no-limit --selected $DEFAULT_OPTIONAL_APPS --height 7 --header "Select optional apps" | tr ' ' '-')

AVAILABLE_THEMES=("eos" "nord" "tokyo-night" "gruvbox" "eos-default" "vanilla")
SELECTED_THEME="eos"
export OHMYDOT_XFCE_THEME=$(gum choose "${AVAILABLE_THEMES[@]}" --limit 1 --selected "$SELECTED_THEME" --height 10 --header "Select your theme")
