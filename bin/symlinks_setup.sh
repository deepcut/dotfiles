#!/bin/bash

echo_info() { tput setaf 2 && echo $1; tput sgr0; }
echo_warn() { tput setaf 1 && echo $1; tput sgr0; }
symlink_replace_dir() {
  rm -rf $2
  ln -sfviF ~/.dotfiles/"$1"/ $2
}
symlink_file() { ln -sfviF ~/.dotfiles/"$1" $2; }

cd ~/.dotfiles
for file in *; do
  if   [[ $file == *"README"* ]]; then continue;
  elif [[ $file == *"nvim"* ]]; then
    echo_info "'$file' is a directory in ~/.config";
    symlink_replace_dir $file ~/.config/"$file"
  elif [[ $file == *"bat.conf"* ]]; then
    echo_info "'$file' is a file in ~/.config"
    symlink_file $file ~/.config/bat/config
  elif [ -d "${file}" ] ; then
    echo_info "'$file' is a directory. Removing then symlinking...";
    symlink_replace_dir $file ~/."$file"
  elif [ -f "${file}" ]; then
    echo_info "'$file' is a file";
    symlink_file $file ~/."$file"
  else
    echo_warn "'$file' is not valid";
  fi
done

