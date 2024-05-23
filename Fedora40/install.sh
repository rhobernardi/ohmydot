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

local OS=$(uname -a)

install_dependencies() {
    packages="git vim tig cmake make byobu zsh alacritty xclip gedit polybar picom rofi"
    case $OS in
        *fedora*)
            specific_packs="gcc g++ redshift-1.12-21.fc40.x86_64"
            sudo dnf update -y
            sudo dnf install -y $packages $specific_packs
            ;;
        *)
            logger "Could not identify OS."
            logger "Aborting."
            exit(1)
            ;;
    esac
}

config_zsh() {
    # Make zsh default shell
    chsh -s /usr/bin/zsh

    # Install ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

config_vim() {
    # Install vim configs and plugins
    wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc \
        && vim -c 'PlugInstall | q | q'
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

    cd $HOME/ohmydot/Fedora40/config
    cp -r $(ls) $HOME/.config

    cd $HOME/ohmydot/Fedora40
    cp -r wallpapers/* $HOME/.wallpapers
    cp gitconfig $HOME/.gitconfig
    cp aliases $HOME/.aliases
    cp bashrc $HOME/.bashrc
    cp zshrc $HOME/.zshrc
    config_vim
    cd
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
            config_ohmydot
            config_vim
            config_zsh
            config_environment
            logger -s "Done."
            ;;
        *)
            logger -e "Error. No Option."
    esac
}

main
