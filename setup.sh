#!/bin/bash

#Install programs
apt update
apt install git htop zsh curl tig neovim

#Change default shell
chsh -s /bin/zsh $USER

#Create links for all dotfiles
for DOTFILE in . 
do
    [ -f "$DOTFILE" ] && ln -s $DOTFILE ~ 
done

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
