#!/bin/bash

#Variables
name="SETUP.SH"
programs="git htop zsh curl tig neovim"
dir="$HOME/.dotfiles"
old_dir="$HOME/.dotfiles_old"
custom_theme="attempt"
files="bashrc vimrc zshrc profile zprofile"
color='\033[0;33m' #yellow
nocolor='\033[0m' # No Color

info() {
    echo -e "$color[$name] $1!$nocolor"
}

backup_files () {
    info "Backing up old dotfiles"
    mkdir -p $old_dir
    cd $dir
    for file in $files; do
       mv ~/.$file $old_dir
    done
}

install_programs(){
   info "Installing programs"
   sudo apt update
   sudo apt install $programs
}

install_ohmyzsh (){
    info "Installing oh-my-zsh"
    exit | sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null
}

install_custom_theme(){
    info "Installing custom theme"
    cp $dir/themes/$custom_theme.zsh-theme $HOME/.oh-my-zsh/themes
}

install_dotfiles () {
    info "Installing dotfiles"
    for src in $(find -H "$dir" -maxdepth 2 -name '*.slink' -not -path '*.git*')
    do
      dst="$HOME/.$(basename "${src%.*}")"
      ln -sfv "$src" "$dst"
    done
}

#backup_files
#install_programs
#install_ohmyzsh
install_custom_theme
install_dotfiles
