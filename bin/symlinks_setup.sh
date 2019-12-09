#!/bin/bash

cd ~/.dotfiles
for file in *; do
  if [[ $file == *"README"* ]]; then continue; fi

  if [ -d "${file}" ] ; then
    echo "'$file' is a directory";
    rm -rf ~/."$file"
    ln -sfviF ~/.dotfiles/"$file"/ ~/."$file"
  else
    if [ -f "${file}" ]; then
      echo "'$file' is a file";
      ln -sfviF ~/.dotfiles/"$file" ~/."$file"
    else
      echo "'$file' is not valid";
      exit 1
    fi
  fi
done

