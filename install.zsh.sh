#!/bin/bash

OH_MY_ZSH_DIR="oh-my-zsh"

for f in $(find $OH_MY_ZSH_DIR -type f); do
  make_sym_link $f 1
done
