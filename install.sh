#!/bin/bash

IGNORE="
  $(basename $0)
"
NON_DOT_LINKS="
  bin
  texmf
"

# Find absolute path of dotfiles directory (wherever this script is)
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

show_warnings () {
  warnings=$(grep --color=always -i -n -A 3 "WARNING:" "$f")
  if [ ! -z "$warnings" ]; then
    echo "$f:"
    echo -e "$warnings"
  fi
}

make_sym_link () {
  dotfile=$1
  with_dot=${2:-0}

  if [ $with_dot == 1 ]; then
    link_name=.$dotfile
  else
    link_name=$dotfile
  fi

  link_path=$HOME/$link_name
  dotfile_path=$LOCAL_DIR/$dotfile

  if [ "$(readlink -f $link_path)" != "$(readlink -f $dotfile_path)" ]; then
    if [ -L "$HOME/$link_name" ]; then
      prompt "~/$link_name points to $(readlink $link_path). Overwrite?"
      [ $? == 1 ] && return 1;
    elif [ -e "$HOME/$link_name" ]; then
      prompt "~/$link_name exists as a regular file. Overwrite?"
      [ $? == 1 ] && return 1;
    else
      show_warnings "$dotfile"
      echo "Creating link: ~/$link_name -> $dotfile_path"
      ln -s $dotfile_path $link_path
    fi
  fi
}

# Move into the dotfiles dir
cd $LOCAL_DIR

# For everything that isn't in NON_DOT_LINKS or IGNORE in the local dir
for f in $(find * -maxdepth 0 -type f); do
  contains "$IGNORE" "$f"
  [ $? == 1 ] && make_sym_link $f 1
done

# Now, for all NON_DOT_LINKS
for d in "$NON_DOT_LINKS"; do
  for f in $(find $d -type f); do
    mkdir -p "$HOME/$(dirname $f)"
    make_sym_link $f 0
  done
done

