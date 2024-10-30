#!/bin/bash

TARGET=$HOME/ohmydot/EndeavourOS
if [[ "$1" != "" ]]; then
    TARGET=$1
fi

# Copy configs from .config
CONFIG_PATH=$HOME/.config
cp -r $CONFIG_PATH/alacritty $TARGET/config
cp -r $CONFIG_PATH/dunst $TARGET/config
cp -r $CONFIG_PATH/i3 $TARGET/config
cp -r $CONFIG_PATH/polybar $TARGET/config
cp -r $CONFIG_PATH/picom $TARGET/config
cp -r $CONFIG_PATH/rofi $TARGET/config
cp -r $CONFIG_PATH/Thunar $TARGET/config


# Copy run commands files
cp $HOME/.gitconfig $TARGET/gitconfig
cp $HOME/.zshrc $TARGET/zshrc
cp $HOME/.bashrc $TARGET/bashrc
cp $HOME/.aliases $TARGET/aliases
cp $HOME/.vimrc $TARGET/../vim/vimrc

cp -r $HOME/.wallpapers/* $TARGET/wallpapers

git status

