#!/bin/bash

#Variables
programs="git htop zsh curl tig neovim"
dir=~/.dotfiles
olddir=~/.dotfiles_old
files="bashrc vimrc vim zshrc oh-my-zsh"

#Backing up old dotfiles
mkdir -p $olddir
cd $dir
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
done

#Install programs
sudo apt update
for prog in $programs; do
	sudo apt install $prog
done

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Create links for all dotfiles
for DOTFILE in `find ~/.dotfiles -maxdepth 1 -type f`
do
    if [[ $DOTFILE != */setup.sh ]]; then
    	#echo $DOTFILE
	sudo ln -sfv $dir/$DOTFILE ~/,$DOTFILE
    fi
done
