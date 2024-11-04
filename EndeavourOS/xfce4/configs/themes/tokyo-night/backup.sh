#!/bin/bash

TARGET=$HOME/ohmydot/EndeavourOS/xfce4/configs/themes/tokyo-night
if [[ "$1" != "" ]]; then
    TARGET=$1
fi

echo "[*] Backup started in $TARGET"

# Copy configs from .config
CONFIG_PATH=$HOME/.config
cp -r $CONFIG_PATH/alacritty $TARGET/.config
cp -r $CONFIG_PATH/btop $TARGET/.config
cp -r $CONFIG_PATH/gtk-3.0 $TARGET/.config
cp -r $CONFIG_PATH/gtk-4.0 $TARGET/.config
cp -r $CONFIG_PATH/Thunar $TARGET/.config
cp -r $CONFIG_PATH/xfce4 $TARGET/.config

# Copy other folders
cp -r $HOME/.themes/* $TARGET/.themes
cp -r $HOME/.icons/* $TARGET/.icons
cp -r $HOME/.wallpapers/* $TARGET/.wallpapers

# Copy run commands files
cp $HOME/.gitconfig $TARGET
cp $HOME/.zshrc $TARGET
cp $HOME/.bashrc $TARGET
cp $HOME/.aliases $TARGET

git status

