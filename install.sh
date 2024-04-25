#!/bin/bash

sudo dnf copr enable skidnik/termite -y
sudo dnf update -y
sudo dnf install -y git vim gcc g++ byobu termite

wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc && vim -c 'PlugInstall | q | q'

git clone https://github.com/rhobernardi/ohmydot
cd ohmydot

if [[ ! -d "~/.config" ]]; then
    mkdir ~/.config
fi
mv config/ ~/.config
mv bashrc ~/.bashrc

cd
