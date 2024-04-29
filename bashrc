# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
echo 'Please type liveinst and press Enter to start the installer'

alias src="vim ~/.bashrc && source ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias i3rc="vim ~/.config/i3/config"
alias i3rst="i3-msg reset"
alias explorer="thunar"
alias la="ls -lAh"
alias ll="ls -lah"
