#!/usr/bin/env bash

set -e

files_dir=$HOME/.nvim
install_dir=$HOME/.config/nvim
backup_dir=$HOME/.config/.old-nvim-config

help_string() {
  cat <<EOF
  --install, -i      -> create symbolic links to all neovim files
  --uninstall, -u    -> remove all symbolic links to neovim files and return to previous configuration if one exists
  --help, -h         -> help
EOF
  return 0
}

install() {
  #copy old config files
  if [ -d "$install_dir" ]; then
    mv "$install_dir" "$backup_dir" >/dev/null
  fi

  mkdir -p "$install_dir"

  file_names=$(ls "$files_dir")

  #link files
  substring_to_remove=".slink"
  for name in $file_names; do
    if [[ "$name" != *"slink"* ]]; then
      continue
    fi
    dst="$install_dir/${name/$substring_to_remove/}"
    ln -sfv "$files_dir/$name" "$dst"
  done

  return 0
}

uninstall() {
  # remove lazy and all plugins
  rm -rf ~/.local/share/nvim/
  # remove all symbolic links to config files
  rm -rf ~/.config/nvim
  #return the old config
  if [ -d "$backup_dir" ]; then
    mv "$backup_dir" "$install_dir"
  fi

  return 0
}

main() {
  if [ "$1" == "--install" ] || [ "$1" == "-i" ]; then
    install
  elif [ "$1" == "--uninstall" ] || [ "$1" == "-u" ]; then
    uninstall
  elif [ "$1" == "--help" ] || [ "$1" == "-h" ]; then
    help_string
  else
    echo "Missing params. Type --help to see all options"
    return 1
  fi
}

main "$1"
