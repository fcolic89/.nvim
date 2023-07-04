#!/usr/bin/env bash

set -e

dir=$HOME/.config/nvim

#clone packer(plugin manager) repo
if [ -d "~/.local/share/nvim/site/pack/packer/" ]; then
 git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi

#copy old files
if [ -d "$dir" ]; then
  mv $dir $HOME/.config/.old-nvim-config > /dev/null
fi

mkdir -p $dir

file_names=`ls $(dirname -- "$0")`

#link files
for name in $file_names
do
  if [[ "${name##*.}" != "slink" ]]; then
      continue
  fi
  dst="$dir/${name%.*}"
  ln -sfv "$(realpath $name)" "$dst"
done
