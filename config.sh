#!/usr/bin/env bash

set -e

usage() {
  cat <<EOF
config.sh [OPTIONS]

Options:
  --install, -i      -> create symbolic links to all neovim files
  --uninstall, -u    -> remove all symbolic links to neovim files and return to previous configuration if one exists
  --help, -h         -> help
EOF
}

install() {
  echo "==> Installing neovim config"

  local install_dir="$HOME/.config/nvim"
  local backup_dir="$HOME/.config/.old-nvim-config-$(date +%s)"

  if [[ -d "$install_dir" ]]; then
    mv "$install_dir" "$backup_dir" >/dev/null
  fi

  mkdir -p "$install_dir"

  local config_location="$(pwd)/$(dirname -- "$0")"
  file_names=$(ls "$config_location")

  local substring_to_remove=".slink"
  for name in $file_names; do
    if [[ "$name" != *"slink"* ]]; then
      continue
    fi
    local dst="$install_dir/${name/$substring_to_remove/}"
    ln -sfv "$config_location/$name" "$dst"
  done
}

uninstall() {
  echo "==> Uninstalling neovim config"

  rm -rf ~/.local/share/nvim/
  rm -rf ~/.config/nvim
}

[[ $# -eq 0 ]] && usage && exit 1

while [[ $# -gt 0 ]]; do
  case "$1" in
  -i | --install)
    install
    shift
    ;;
  -u | --uninstall)
    uninstall
    shift
    ;;
  -h | --help)
    usage
    shift
    ;;
  --)
    shift
    break
    ;;
  *)
    echo "==> Missing a valid parameter"
    usage
    exit 1
    ;;
  esac
done
