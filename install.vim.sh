#!/bin/bash

VIM_DIRS="
  vim/after
  vim/autoload
  vim/colors
"
BUNDLE_DIR="vim/bundle"

# Link regular files in each dir in $VIM_DIRS
for vimdir in $VIM_DIRS; do
  mkdir -p "$HOME/.$vimdir"
  for f in $(find $vimdir -type f); do
    make_sym_link $f 1
  done
done

# init & update each submodule in vim/bundle
mkdir -p "$HOME/.$BUNDLE_DIR"
for submod in $BUNDLE_DIR/*; do
  if ! git submodule init $submod &>/dev/null; then
    >&2 echo "error: git submodule init $submod"
    >&2 echo "Skipping $submod"
    continue
  fi
  if ! git submodule update $submod &>/dev/null; then
    >&2 echo "error: git submodule update $submod"
    >&2 echo "Skipping $submod"
    continue
  fi
  make_sym_link $submod 1
done

