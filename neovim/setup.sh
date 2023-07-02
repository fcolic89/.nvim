#!/usr/bin/env bash

set -e

dir=$HOME/.config/nvim

#copy old files
if [ -d "$dir" ]; then
  mv $dir $HOME/.config/.old-nvim-config > /dev/null
fi

mkdir -p $dir

file_names=`ls $(dirname -- "$0")`

for name in $file_names
do
  if [ "$name" == "setup.sh" ]; then
      continue
  fi
  dst="$dir/${name%.*}"
  ln -sfv "$(realpath $name)" "$dst"
done
