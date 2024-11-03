yay -S zsh --noconfirm

# Make zsh default shell
# chsh -s /usr/bin/zsh

# Install ohmyzsh
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
