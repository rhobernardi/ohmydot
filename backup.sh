#!/bin/bash

TARGET=$HOME/ohmydot
if [[ "$1" != "" ]]; then
    TARGET=$1
fi

CONFIG_PATH=$HOME/.config
cp -r $CONFIG_PATH/alacritty $TARGET/config
cp -r $HOME/.config/i3 $TARGET/config
cp -r $HOME/.config/polybar $TARGET/config
cp -r $HOME/.config/picom $TARGET/config
cp -r $HOME/.config/Thunar $TARGET/config
# cp -r $HOME/.config/byobu $TARGET/config
# cp -r $HOME/.config/xfce4 $TARGET/config

cp $HOME/.zshrc $TARGET/zshrc
cp $HOME/.bashrc $TARGET/bashrc
cp $HOME/.aliases $TARGET/aliases
cp $HOME/.vimrc $TARGET/vimrc

cp -r $HOME/Pictures/wallpapers/* $TARGET/wallpapers

git status

