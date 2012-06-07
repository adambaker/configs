#!/bin/bash
if [ -z `which zsh` ]; then 
  echo 'You must install zsh first. Try sudo apt-get install zsh.';
  exit 1;
fi

#install_path=$(dirname "$PWD/$0")
#echo $install_path
