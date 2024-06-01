# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"
plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
plug "zap-zsh/zap-prompt"
plug "rhobernardi/simple-prompt"
# plug "zsh-users/zsh-syntax-highlighting"

plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/key-bindings.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

# My prompt
# PROMPT="╭─%B%{$fg[green]%}%n%{$fg[white]%}@%{$fg[grey]%}%m % %{$fg_bold[cyan]%}%~%{$reset_color%}\$vcs_info_msg_0_
# "
# PROMPT+="╰─%(?:%{$fg_bold[white]%}$:%{$fg_bold[red]%}$)%{$reset_color%} "
