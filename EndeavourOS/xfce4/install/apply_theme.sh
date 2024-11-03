#!/bin/bash

XfceTheming() {
    local -r new_theme="$1"
    local -r date_time=$(date +%Y%m%d-%H:%M.%S)
    local -r ohmydot_dir="$HOME/ohmydot/EndeavourOS/xfce4/install/themes"
    local -r conf="$HOME/.config"
    local -r conf2='~/.config'
    local -r bak=xfce-theme-bak
    local dir
    local msg=""
    local dirs=(xfce4)
    # expac -Q %n endeavouros-skel-xfce4 >/dev/null && dirs+=(Thunar)                        # compatibility for old installs
    local -r dirs_list=$(echo "${dirs[*]}" | tr ' ' ',')

    msg+="\nAbout to change the Xfce theme to '$new_theme'.\n"
    msg+="The current theme will be saved under folder $conf2/$bak/$date_time\n"
    msg+="The new theme will be in folders $conf2/{$dirs_list}\n\n"
    msg+="Accept theme change and reboot? [y/N] "

    # eos_yad --form --title="Change Xfce theme to $new_theme" --text="$msg" --image=$ICO_THEME \
    # --button='yad-cancel!!Do nothing':1 --button='yad-ok!!Accept theme change and reboot now':0

    printf "$msg"
    read reboot
    case "$reboot" in
        'y'|'Y')
            mkdir -p "$conf/$bak/$date_time"
            for dir in "${dirs[@]}" ; do
                mv "$conf/$dir" "$conf/$bak/$date_time/$dir" || return 1                                # save current theme
                case "$new_theme" in
                    EOS) mv "$ohmydot_dir/$new_theme/.config/$dir" "$conf/" || return 1 ;;            # apply EOS theme
                    Custom) mv "$ohmydot_dir/$new_theme/.config/$dir" "$conf/" || return 1 ;;            # apply EOS theme
                    Nord) mv "$ohmydot_dir/$new_theme/.config/$dir" "$conf/" || return 1 ;;           # apply Nord theme
                    Gruvbox) mv "$ohmydot_dir/$new_theme/.config/$dir" "$conf/" || return 1 ;;        # apply Gruvbox theme
                    Tokio-Night) mv "$ohmydot_dir/$new_theme/.config/$dir" "$conf/" || return 1 ;;     # apply Tokio-Night theme
                    vanilla) ;;
                esac
            done
            sleep 1
            #reboot
            ;;
    esac
}

XfceTheming $1

