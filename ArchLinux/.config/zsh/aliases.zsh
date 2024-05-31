#!/usr/bin/env zsh

# Run commands
alias src="vim ~/.zshrc && source ~/.zshrc"
alias brc="vim ~/.bashrc && source ~/.bashrc"
alias vrc="vim ~/.vimrc"

# System configs
alias zsh-alias="vim ~/.config/zsh/aliases.zsh && source ~/.zshrc"
alias zsh-functions="vim ~/.config/zsh/functions.zsh && source ~/.zshrc"
alias picomconfig="vim ~/.config/picom/picom.conf"
alias termiconfig="vim ~/.config/alacritty/alacritty.toml"
alias i3rst="i3-msg restart"
alias i3config="vim ~/.config/i3/config"

# System usage
alias explorer="xdg-open"
alias cexplorer="ranger"

# ls variations
alias l='ls -lah'
alias l.='ls -d .* --color=auto'
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'
alias lsa='ls -lah'

# Others
# alias arduino="~/Downloads/arduino-ide_nightly-20240507_Linux_64bit.AppImage &"

