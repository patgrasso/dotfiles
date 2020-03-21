#!/bin/bash

BUNDLE_DIR="vim/bundle"

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

