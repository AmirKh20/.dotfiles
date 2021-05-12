#/bin/sh
sudo pacman -S --needed - < packages.txt &&

sudo pacman -S --needed base-devel &&
git clone https://aur.archlinux.org/paru.git &&
cd paru &&
makepkg -si &&
cd ~/.packages/ &&
paru -S --needed - < aur-packages.txt &&

pip install -r pip-packages.txt &&

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim &&
vim +PluginInstall +qall &&
cd ~/.config/st/luke-st/ && make && sudo make install &&

grep -q "^Color" /etc/pacman.conf || sudo sed -i "s/^#Color$/Color/" /etc/pacman.conf
grep -q "^VerbosePkgLists" /etc/pacman.conf || sudo sed -i "s/^#VerbosePkgLists$/VerbosePkgLists/" /etc/pacman.conf
grep -q "ILoveCandy" /etc/pacman.conf || sudo sed -i "/VerbosePkgLists/a ILoveCandy" /etc/pacman.conf

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
sudo sed -i "s/^greeter-setup-script.*/greeter-setup-script=/usr/bin/numlockx on/" /etc/lightdm/lightdm.conf

