yay -S vim --noconfirm

cp ~/.vimrc ~/.vimrc.bak
wget -O ~/.vimrc https://raw.githubusercontent.com/rhobernardi/vimrc/master/vimrc
vim -c 'PlugInstall | q | q'
