#!/bin/bash

TARGET=$HOME/ohmydot
if [[ "$1" == "" ]]; then
    TARGET=$1
fi

CONFIG_PATH=$HOME/.config
cp -r $CONFIG_PATH/alacritty $TARGET/config
cp -r $HOME/.config/i3 $TARGET/config
cp -r $HOME/.config/byobu $TARGET/config
cp -r $HOME/.config/Thunar $TARGET/config
cp -r $HOME/.config/xfce4 $TARGET/config

cp $HOME/.zshrc $HOME/.bashrc $HOME/.vimrc $HOME/.fehbg $TARGET

MOZILLA_BKP=$(ls $HOME/.mozilla/firefox | grep -E *.default-release)
zip -r $MOZILLA_BKP.zip $HOME/.mozilla/firefox/$MOZILLA_BKP
sudo mv $MOZILLA_BKP.zip /run/media/liveuser/persistence/

git status

