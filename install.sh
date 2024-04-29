#!/bin/bash

sudo dnf update -y
sudo dnf install -y git vim gcc g++ byobu zsh  alacritty

chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc && vim -c 'PlugInstall | q | q'

git clone https://github.com/rhobernardi/ohmydot

cd
mv .bashrc .bashrc.bkp

cd ohmydot
if [[ ! -d "$HOME/.config" ]]; then
    mkdir $HOME/.config
fi

cd config
cp -r $(ls) $HOME/.config

cd ..
mv bashrc $HOME/.bashrc
mv zshrc $HOME/.zshrc
cd
