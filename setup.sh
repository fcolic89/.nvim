#!/usr/bin/env bash

#Variables
NAME="SETUP.SH"
GITHUB_REPO="https://github.com/fcolic89/.dotfiles"
GITHUB_REPO_SSH="git@github.com:fcolic89/.dotfiles.git"
PROGRAMS_TO_INSTALL="htop zsh tig vim tmux fzf ranger"
INSTALL_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.old-dotfiles"
CUSTOM_THEME="attempt"
files="bashrc vimrc zshrc profile zprofile"
color_yellow='\e[33m' #yellow
color_red='\e[31m' #red
nocolor='\e[0m' # No Color

info_message() {
    echo -e "$color_yellow[$NAME] $1!$nocolor"
}

error_message() {
    echo -e "$color_red[$NAME] $1!$nocolor"
}

backup_files () {
    info_message "=> Backing up old dotfiles"
    mkdir -p $BACKUP_DIR
    for file in $files; do
       mv ~/.$file $BACKUP_DIR
    done
}

install_programs(){
   if [ "$PROGRAMS" = "0" ]; then
     return 0
   fi
   info_message "=> Installing programs"
   if [ -n "$(uname -a | grep 'Linux')" ]; then
     if [ $(command -v "apt") ]; then
       sudo apt update
       sudo apt install $PROGRAMS_TO_INSTALL
     elif [ $(command -v "dnf") ]; then
       sudo dnf check-update
       sudo dnf install $PROGRAMS_TO_INSTALL
      fi
   else
     error_message "=> No known way of installing programs"
   fi
}

install_ohmyzsh (){
    if [ -d "$HOME/.oh-my-zsh" ]; then
      info_message "=> Oh-my-zsh is already inslled, trying to update"
      command git -C "$ZSH" pull
    else
      info_message "=> Installing oh-my-zsh"
      exit | sh -c "$(command curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null
    fi

    info_message "=> Installing syntax highlighting plugin"
    command git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting 2> /dev/null

    info_message "=> Installing custom theme"
    command ln -sfv "$INSTALL_DIR/themes/$CUSTOM_THEME.zsh-theme" "$HOME/.oh-my-zsh/custom/themes" 
}

switch_git_branch(){
  # Switch to a different brach, if one is provided by the user
  if [ ! -z "$GITHUB_BRANCH" ]; then
    command git -C "$INSTALL_DIR" fetch origin "$GITHUB_BRANCH" 2> /dev/null
    if [ $(command git -C "$INSTALL_DIR" branch -a | command grep "$GITHUB_BRANCH") 2> /dev/null ]; then
      info_message "=> Switching to branch $GITHUB_BRANCH"
      command git -C "$INSTALL_DIR" switch "$GITHUB_BRANCH"
    fi
  fi
}

get_dotfiles_from_git(){
  if [ -d "$INSTALL_DIR/.git" ]; then
    switch_git_branch
    # Update repo
    info_message "=> Dotfiles already installed in $INSTALL_DIR, trying to update using git"
    command git -C "$INSTALL_DIR" pull || {
      error_message "=> Failed to update dotfiles, run 'git pull' in $INSTALL_DIR yourself"
      exit
    }
  else
    # Clone repo
    mkdir -p "$INSTALL_DIR"
    info_message "=> Cloning git repo"
    if [ "$GITHUB_SSH" = "1" ]; then
      command git clone "$GITHUB_REPO_SSH" "$INSTALL_DIR" || {
        error_message "=> Failed to clone dotfiles repo! Better luck next time."
        exit
      }
    else
      command git clone "$GITHUB_REPO" "$INSTALL_DIR" || {
        error_message "=> Failed to clone dotfiles repo! Better luck next time."
        exit
      }
    fi
    switch_git_branch
  fi
}

link_dotfiles () {
    info_message "=> Linking dotfiles"
    for src in $(command find -H "$INSTALL_DIR" -maxdepth 2 -name '*.slink' -not \( -path '*.git*' -path '*neovim/*' \))
    do
      dst="$HOME/.$(basename "${src%.*}")"
      command ln -sfv "$src" "$dst"
    done
}

main(){
  if [ ! $(type -p "git") ] || [ ! $(type -p "curl") ]; then
    error_message "=> Failed to start setup script. Git and curl need to be installed!"
    exit
  fi
  backup_files
  get_dotfiles_from_git
  install_programs
  install_ohmyzsh
  link_dotfiles
}

main

