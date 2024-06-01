#!/bin/bash

TARGET=$HOME/ohmydot/ArchLinux
if [[ "$1" != "" ]]; then
    TARGET=$1
fi

# Copy configs from .config
CONFIG_PATH=$HOME/.config
cp -r $CONFIG_PATH/alacritty $TARGET/.config
cp -r $CONFIG_PATH/dunst $TARGET/.config
cp -r $CONFIG_PATH/i3 $TARGET/.config
cp -r $CONFIG_PATH/kitty $TARGET/.config
cp -r $CONFIG_PATH/polybar $TARGET/.config
cp -r $CONFIG_PATH/picom $TARGET/.config
cp -r $CONFIG_PATH/rofi $TARGET/.config
cp -r $CONFIG_PATH/ranger $TARGET/.config
cp -r $CONFIG_PATH/zsh $TARGET/.config


# Copy run commands files
cp $HOME/.gitconfig $TARGET
cp $HOME/.zshrc $TARGET
cp $HOME/.bashrc $TARGET
cp $HOME/.vimrc $TARGET

cp -r $HOME/.wallpapers/* $TARGET/.wallpapers

git status

