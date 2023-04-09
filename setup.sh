#!/bin/bash

#Variables
name="SETUP.SH"
programs="git htop zsh curl tig neovim"
dir=~/.dotfiles
olddir=~/.dotfiles_old
files="bashrc vimrc zshrc profile zprofile"
color='\033[0;33m' #yellow
nocolor='\033[0m' # No Color

#Backing up old dotfiles
echo -e "${color}[$name] Backing up old dotfiles in $olddir!${nocolor}"
mkdir -p $olddir
cd $dir
for file in $files; do
    mv ~/.$file $olddir
done

#Install programs
echo -e "${color}[$name] Installing programs!${nocolor}"
sudo apt update
sudo apt install $programs

#Install oh-my-zsh
echo -e "${color}[$name] Installing oh-my-zsh!${nocolor}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Create links for all dotfiles
echo -e "${color}[$name] Creating links to dotfiles!${nocolor}"
for DOTFILE in `find ~/.dotfiles -maxdepth 1 -type f`
do
    filename=${DOTFILE##*/}
    if [[ $filename != setup.sh ]]; then
    	#echo $DOTFILE
	sudo ln -sfv $dir/$filename ~/".$filename"
    fi
done
