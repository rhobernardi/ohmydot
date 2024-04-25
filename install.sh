#!/bin/bash

sudo dnf copr enable skidnik/termite
sudo dnf update
sudo dnf install -y git vim gcc g++ byobu termite

wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc && vim -c 'PlugInstall | q | q'

if [[ ! -d "~/.config" ]]; then
    mkdir ~.config
fi
cp -r config/* ~/.config
cp bashrc ~/.bashrc

