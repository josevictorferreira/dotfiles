#!/usr/bin/bash

# Sorting mirrors by speed
sudo pacman-mirrors -g

# Updating packages
sudo pacman -Syyu

# Install firefox
sudo pacman -S firefox

# Install pacaur
sudo pacman -S expac yajl --noconfirm
mkdir ~/temp
cd ~/temp
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg -i PKGBUILD --noconfirm
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg -i PKGBUILD --noconfirm
cd ~
rm -r ~/temp

# Install yadm
pacaur -S yadm-git

# Installing chrome
pacaur -S google-chrome

# Install git
sudo pacman -S git

# Installing tilix terminal
pacaur -S tilix

# Fixing audio issues
# Reboot after
pacaur -S asoundconf
asoundconf set-default-card PCH
sudo pacman -S pavucontrol
# Install pulseaudio-equalizer
pacaur -S pulseaudio-equalizer-ladspa

# Installing zsh and oh-my-zsh
sudo pacman -S zsh
sh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install and configuring neovim
sudo pacman -S neovim
sudo pacman -S python2-neovim
sudo pacman -S python-neovim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir /home/josevictor/.config/nvim
git clone https://github.com/josevictorferreira/josevictor_vimconfigs.git /home/josevictor/.config/nvim
echo "vi() { nvim \$1 }" >> /home/josevictor/.zshrc
echo "vim() { nvim \$1 }" >> /home/josevictor/.zshrc

# Install rofi to replace dmenu
# launch = rofi -show run
sudo pacman -S rofi

# install powerline fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
cd ..
rm -rf fonts

# Create workspace and faculdade folder
mkdir /home/josevictor/workspace
mkdir /home/josevictor/faculdade

# Adding some useful alias
echo "alias wspc='cd /home/josevictor/workspace'" >> /home/josevictor/.zshrc
echo "alias facul='cd /home/josevictor/faculdade'" >> /home/josevictor/.zshrc
echo "mon() { xrandr --output eDP1 --brightness \$1 }" >> /home/josevictor/.zshrc
echo "hdmi() { xrandr --output HDMI1 --brightness \$1 }" >> /home/josevictor/.zshrc
echo "alias keybr='sudo setxkbmap -layout br'" >> /home/josevictor/.zshrc
echo "alias keyus='sudo setxkbmap -layout us'" >> /home/josevictor/.zshrc
echo "alias nbean='netbeans -J-Dswing.aatext=true -J-Dawt.useSystemAAFontSettings=on'" >> /home/josevictor/.zshrc

# Installing asdf version manager
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.2.1
echo -e '\n. $HOME/.asdf/asdf.sh' >> ~/.zshrc

# Install spotify
pacaur -S spotify

# Install netbeans
sudo pacman -S netbeans

# Install dropbox
pacaur -S dropbox

# Install gedit
sudo pacman -S gedit

# Install libreoffice
sudo pacman -S libreoffice-fresh

# Install fzf
sudo pacman -S fzf

# Install polybar
sudo pacman -S cmake
git clone --branch 3.0.5 --recursive https://github.com/jaagr/polybar
cd polybar
mkdir build
cd build
cmake ..
sudo make install
make userconfig

# Install tlp for power management
sudo pacman -S tlp
sudo systemctl start tlp.service
sudo systemctl start tlp-sleep.service

# Install tmux
sudo pacman -S tmux
# Install tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install rustup
curl -sSf https://static.rust-lang.org/rustup.sh | sh

# Install ripgrep
cargo install ripgrep

# Install alacritty
git clone https://aur.archlinux.org/alacritty-git.git
cd alacritty-git
makepkg -isr
