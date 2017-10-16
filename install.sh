#!/bin/bash

IGNORE="
  $(basename $0)
"
NON_DOT_LINKS="
  bin
  texmf
"

LOCAL_DIR=`pwd`/$(dirname $0)
[ `basename $LOCAL_DIR` == "." ] && LOCAL_DIR=`pwd`

contains () {
  [[ $1 =~ (^|[[:space:]])$2($|[[:space:]]) ]] && return 0 || return 1
}

prompt () {
  echo -n "$1 [Y,n]: "
  read -n 1 response

  while [ $response != "Y" ] && [ $response != "n" ]; do
    echo -ne "\nPlease choose [Y,n]: "
    read -n 1 response
  done
  echo

  [ $response == "Y" ] && return 0
  return 1
}

make_sym_link () {
  dotfile=$(basename $1)
  with_dot=${2:-0}

  if [ $with_dot == 1 ]; then
    link_name=.$dotfile
  else
    link_name=$dotfile
  fi

  link_path=$HOME/$link_name
  dotfile_path=$LOCAL_DIR/$dotfile

  if [ $(readlink $link_path) != "$dotfile_path" ]; then
    if [ -L "$HOME/$link_name" ]; then
      prompt "~/$link_name points to $(readlink $link_path). Overwrite?"
      [ $? == 1 ] && return 1;
    elif [ -e "$HOME/$link_name" ]; then
      prompt "~/$link_name exists as a regular file. Overwrite?"
      [ $? == 1 ] && return 1;
    else
      echo "Creating link: ~/$link_name -> $dotfile_path"
      ln -s $dotfile_path $link_path
    fi
  fi
}

for f in $LOCAL_DIR/*; do
  dotfile=$(basename $f)
  contains "$IGNORE $NON_DOT_LINKS" "$dotfile"
  [ $? == 1 ] && make_sym_link $dotfile 1
done

