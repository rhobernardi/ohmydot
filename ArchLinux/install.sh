#!/bin/bash

logger () {
    arg=$1
    log=$2
    case $arg in
        "-i" | "--info")
            echo "[i] $log"
            ;;
        "-s" | "--success")
            echo "[*] $log"
            ;;
        "-w" | "--warning")
            echo "[!] $log"
            ;;
        "-e" | "--error")
            echo "[X] $log"
            ;;
        *)  ;;
    esac
}

OS=$(uname -a)

install_dependencies() {
    packages="git vim tig wget curl cmake make zsh alacritty xclip maim polybar
              base-devel archlinux-keyring picom rofi gcc-multilib redshift
              telegram-desktop"
    case $OS in
        *arch*)
            sudo pacman -Syyuu --noconfirm
            sudo pacman -S --noconfirm --needed $packages
            if [[ ! -d $HOME/.config/BraveSoftware ]]; then
                yay -S --noconfirm brave-bin
            fi
            ;;
        *)
            logger "Could not identify OS."
            logger "Aborting."
            ;;
    esac
}

config_zsh() {
    # Make zsh default shell
    chsh -s /usr/bin/zsh
    # Install Zap
    if [[ ! -d $HOME/.local/share/zap ]]; then
        zsh <(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh) --branch release-v1
    fi
}

config_vim() {
    # Install vim configs and plugins
    wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc
    vim -c 'PlugInstall | q | q'
}

config_ohmydot() {
    # Clone configs repo and install all configs
    git clone --recursive https://github.com/rhobernardi/ohmydot
}

config_environment() {
    cd $HOME

    # create folders
    if [[ ! -d "$HOME/ohmydot" ]]; then
        config_ohmydot
    fi
    if [[ ! -d "$HOME/.config" ]]; then
        mkdir $HOME/.config
    fi
    if [[ ! -d "$HOME/.wallpapers" ]]; then
        mkdir $HOME/.wallpapers
    fi

    cd $HOME/ohmydot/ArchLinux
    cp -r .config $HOME/

    config_zsh

    cd $HOME/ohmydot/ArchLinux
    cp -r .wallpapers/* $HOME/.wallpapers
    cp .gitconfig $HOME/.gitconfig
    cp .aliases $HOME/.aliases
    cp .bashrc $HOME/.bashrc
    cp .zshrc $HOME/.zshrc
    config_vim
    cd
}

restore_configs() {
    # Clone original configs and restore
    git clone https://github.com/rhobernardi/alg-i3-settings
    local REPO=alg-i3-settings/etc/skel
    cp -r $REPO/.config $HOME
    cp -r $REPO/.icons $HOME
    chsh -s /bin/bash
    cp -r $REPO/.bashrc $HOME
    cp -r $REPO/.vimrc $HOME
}

subcommand=${1:-"--full"}

main() {
    case $subcommand in
        "-c" | "--config")
            # (Re)config environment
            logger -i "Configuring environment.."
            config_environment
            logger -s "Done."
            ;;
        "-d" | "--dependencies")
            # Install dependencies
            logger -i "Installing dependencies.."
            install_dependencies
            logger -s "Done."
            ;;
        "-f" | "--full")
            logger -i "Full installation selected.."
            install_dependencies
            config_environment
            logger -s "Done."
            ;;
        "-r" | "--restore")
            logger -i "Restoring original config from Arch Linux GUI.."
            restore_configs
            logger -s "Done."
            ;;
        *)
            logger -e "Error. No Option."
    esac
}

main
