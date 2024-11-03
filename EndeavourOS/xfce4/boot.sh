set -e

# echo -e "$ascii_art"
echo "=> Ohmydot is for fresh Arch XFCE 4 distros or newer installations only!"
echo -e "\nBegin installation (or abort with ctrl+c)..."

command -v yay >/dev/null 2>&1 || sudo pacman -S --noconfirm yay git
yay -Syyuu --noconfirm

echo "Cloning ohmydot..."
rm -rf ~/.local/share/ohmydot
git clone https://github.com/rhobernardi/ohmydot.git ~/.local/share/ohmydot >/dev/null
if [[ $OHMYDOT_REF != "master" ]]; then
  cd ~/.local/share/ohmydot
  git fetch origin "${OHMYDOT_REF:-stable}" && git checkout "${OHMYDOT_REF:-stable}"
  cd -
fi

echo "Installation starting..."
source ~/.local/share/ohmydot/EndeavourOS/xfce4/install.sh
