#!/bin/bash

# Update dnf and install basic packages
sudo dnf update -y
sudo dnf install -y git vim gcc g++ byobu zsh polybar alacritty xclip gedit

# Make zsh default shell
chsh -s /usr/bin/zsh

# Install vim configs and plugins
wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc \
        && vim -c 'PlugInstall | q | q'

# Clone configs repo and install all configs
git clone https://github.com/rhobernardi/ohmydot

cd
mv .bashrc .bashrc.bkp

cd ohmydot
if [[ ! -d "$HOME/.config" ]]; then
    mkdir $HOME/.config
fi

cd config
cp -r $(ls) $HOME/.config

# Install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

cd ..
mv wallpapers $HOME/Pictures/
mv bashrc $HOME/.bashrc
mv zshrc $HOME/.zshrc
mv zshrc $HOME/.aliases
cd

