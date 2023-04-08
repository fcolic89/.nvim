#!/bin/bash

#Install programs
sudo apt update
sudo apt install git htop zsh curl tig neovim

#Create links for all dotfiles
for DOTFILE in `find ~/.dotfiles -maxdepth 1 -type f`
do
    if [[ $DOTFILE != */setup.sh ]]; then
    	#echo $DOTFILE
	sudo ln -sfv $DOTFILE ~
    fi
done

#Install oh-my-zsh
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
