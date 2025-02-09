#!/usr/bin/env bash

set -e

install_dir="$HOME/.config/nvim"
backup_dir="$HOME/.config/.old-nvim-config"

usage() {
  cat <<EOF
config.sh [OPTIONS]

Options:
  --install, -i      -> create symbolic links to all neovim files
  --uninstall, -u    -> remove all symbolic links to neovim files and return to previous configuration if one exists
  --help, -h         -> help
EOF
  return 0
}

install() {
  echo "==> Installing neovim config"

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

  return 0
}

uninstall() {
  echo "==> Uninstalling neovim config"

  rm -rf ~/.local/share/nvim/
  rm -rf ~/.config/nvim

  echo "==> Restoring backup version of the config"
  if [[ -d "$backup_dir" ]]; then
    mv "$backup_dir" "$install_dir"
  fi

  return 0
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
    break
    ;;
  *)
    echo "==> Missing a valid parameter"
    usage
    ;;
  esac
done
