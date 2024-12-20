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
    packages="git nvim tig btop fastfetch cmake make zsh alacritty gedit"
    # packages=$packages" bitwarden telegram-desktop gcc-multilib"
    case $OS in
        *fc40*)
            sudo dnf update -y
            sudo dnf install -y $packages
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

    # Install ohmyzsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
}

config_vim() {
    # Backup existing vimrc
    if [[ -f "~/.vimrc" ]]; then
        cp ~/.vimrc ~/.vimrc.bak
    fi
    # Install vim configs and plugins
    wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc \
        && vim -c 'PlugInstall | q | q'
}

config_ohmydot() {
    # Clone configs repo and install all configs
    git clone --recursive https://github.com/rhobernardi/ohmydot $HOME/ohmydot
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
    if [[ ! -d "$HOME/.themes" ]]; then
        mkdir $HOME/.themes
    fi
    if [[ ! -d "$HOME/.icons" ]]; then
        mkdir $HOME/.icons
    fi

    # cd $HOME/ohmydot/Fedora40/xfce4/.config
    # cp -r $(ls) $HOME/.config

    cd $HOME/ohmydot/Fedora40/xfce4
    logger -i "Installing .config..."
    cp -r .config/* $HOME/.config
    logger -i "Installing .wallpapers..."
    cp -r .wallpapers/* $HOME/.wallpapers
    logger -i "Installing .themes..."
    cp -r .themes/* $HOME/.themes
    logger -i "Installing .icons..."
    cp -r .icons/* $HOME/.icons
    logger -i "Installing .gitconfig..."
    cp .gitconfig $HOME/.gitconfig
    logger -i "Installing .aliases..."
    cp .aliases $HOME/.aliases
    logger -i "Installing .bashrc..."
    cp .bashrc $HOME/.bashrc
    logger -i "Installing .zshrc..."
    cp .zshrc $HOME/.zshrc
    logger -i "Installing vim..."
    config_vim
    cd

    xfdesktop --reload
    xfce4-panel --reload
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
            config_zsh
            config_environment
            logger -s "Done."
            ;;
        *)
            logger -e "Error. No Option."
    esac
}

main
