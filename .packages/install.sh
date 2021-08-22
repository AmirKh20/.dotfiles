#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
MAGENTA='\033[0;35m'
RESET='\033[0m'

enter_to_continue()
{
    echo -e "${MAGENTA}Press Enter to continue${RESET}"
    read && clear
}

[ "$USER" = "root" ] && echo "Do Not Run this with root!" && exit 1
[ ! -d ~/.packages ] && echo "~/.packages directory should exist" && exit 1

sudo pacman -S --needed - < packages.txt
enter_to_continue

sudo pacman -S --needed base-devel &&
git clone https://aur.archlinux.org/paru.git &&
cd paru &&
makepkg -si
enter_to_continue

cd ~/.packages/ &&
paru -S --needed - < aur-packages.txt
enter_to_continue

pip install -r pip-packages.txt
enter_to_continue

[ ! -d ~/.vim/bundle/Vundle.vim ] && git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim && vim +PluginInstall +qall
enter_to_continue

[ -d ~/.config/st/luke-st ] && cd ~/.config/st/luke-st/ && make && sudo make install
[ -d ~/.config/dmenu/luke-dmenu ] && cd ~/.config/dmenu/luke-dmenu && make && sudo make install
enter_to_continue

grep -q "^Color" /etc/pacman.conf || sudo sed -i "s/^#Color$/Color/" /etc/pacman.conf
grep -q "^VerbosePkgLists" /etc/pacman.conf || sudo sed -i "s/^#VerbosePkgLists$/VerbosePkgLists/" /etc/pacman.conf
grep -q "ILoveCandy" /etc/pacman.conf || sudo sed -i "/VerbosePkgLists/a ILoveCandy" /etc/pacman.conf
grep -q "^ParallelDownloads" /etc/pacman.conf || sudo sed -i "s/^#ParallelDownloads.*/ParallelDownloads = 3/" /etc/pacman.conf

grep -q "^AurOnly" /etc/paru.conf || sudo sed -i "s/^#AurOnly/AurOnly/" /etc/paru.conf
grep -q "^BottomUp" /etc/paru.conf || sudo sed -i "s/^#BottomUp/BottomUp/" /etc/paru.conf

[ ! -f /etc/X11/xorg.conf.d/30-touchpad.conf ] && sudo printf 'Section "InputClass"
	Identifier "touchpad"
  Driver "libinput"
  Option "tapping" "on"
  Option "ScrollMethod" "edge"
EndSection' | sudo tee /etc/X11/xorg.conf.d/30-touchpad.conf >>/dev/null

sudo systemctl enable lightdm
grep -q "lightdm-webkit2-greeter" /etc/lightdm/lightdm.conf || sudo sed -i "s/^#greeter-session=.*/greeter-session=lightdm-webkit2-greeter/" /etc/lightdm/lightdm.conf
grep -q "glorious" /etc/lightdm/lightdm-webkit2-greeter.conf || sudo sed -i "s/^webkit_theme.*/webkit_theme        = glorious/" /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i "s/^debug_mode.*/debug_mode          = true/" /etc/lightdm/lightdm-webkit2-greeter.conf
sudo sed -i "s/^#greeter-setup-script.*/greeter-setup-script=\/usr\/bin\/numlockx on/" /etc/lightdm/lightdm.conf
enter_to_continue

[ ! -d ~/.cache/zsh ] && mkdir -p ~/.cache/zsh/
[ ! -f ~/.cache/zsh/zsh_history ] && touch ~/.cache/zsh/zsh_history
[ ! -d ~/Pictures ] && mkdir ~/Pictures
ln -s ~/.config/awesome/themes/powerarrow-blue/starwars.jpg ~/Pictures/bg

[ -f /bin/zsh ] && chsh -s /bin/zsh

systemctl --user enable pulseaudio.service
enter_to_continue

echo "blacklist pcspkr" | sudo tee /etc/modprobe.d/nobeep.conf >>/dev/null
echo "blacklist uvcvideo" | sudo tee /etc/modprobe.d/nowebcam.conf >>/dev/null

printf '[global-dns-domain-*]
servers=9.9.9.9,1.1.1.1,1.0.0.1,2606:4700:4700::1111,2606:4700:4700::1001,2620:fe::fe' | sudo tee /etc/NetworkManager/conf.d/dns-servers.conf >>/dev/null
