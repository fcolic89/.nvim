#!/usr/bin/env bash

set -e

dir=$HOME/.config/nvim
old_dir=$HOME/.config/.old-nvim-config

help_string(){
  cat << EOF
  --install, -i      -> create symbolic links to all neovim files
  --uninstall, -u    -> remove all symbolic links to neovim files and return to previous configuration if one exists
  --help, -h         -> help
EOF
  return 0
}


install(){
  #clone packer(plugin manager) repo
  if [ ! -d "~/.local/share/nvim/site/pack/packer/" ]; then
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
  fi

  #copy old config files
  if [ -d "$dir" ]; then
    mv $dir $old_dir > /dev/null
  fi

  mkdir -p $dir

  file_names=`ls $(dirname -- "$0")`

  #link files
  substring_to_remove=".slink"
  for name in $file_names
  do
    if [[ "$name" != *"slink"* ]]; then
        continue
    fi
    dst="$dir/${name/$substring_to_remove}"
    ln -sfv "$(realpath $name)" "$dst"
  done
  
  #download all plugins
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' 2> /dev/null
  return 0
}

uninstall(){
  # remove packer and all plugins
  rm -rf ~/.local/share/nvim/site/pack/
  # remove all symbolic links to config files
  rm -rf ~/.config/nvim
  #return the old config
  if [ -d "$old_dir" ]; then
    mv $old_dir $dir                         
  fi
  return 0
}

main(){
  if [ "$1" == "--install" -o "$1" == "-i" ]; then
    install
    return $?
  elif [ "$1" == "--uninstall" -o "$1" == "-u" ]; then
    uninstall
    return $?
  elif [ "$1" == "--help" -o "$1" == "-h" ]; then
    help_string
    return $?
  else
    echo "Missing params. Type --help to see all options"
    return 1
  fi
}

main $1
