#!/bin/bash
if [ -z `which zsh` ]; then 
  echo 'You must install zsh first. Try sudo apt-get install zsh.';
  exit 1;
fi

old_dir=$PWD
install_path=$(dirname "$PWD/$0")
cd
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
if [ -e .zshrc ]; then
  if [ -f .zshrc ]; then 
    echo 'Backing up .zshrc as .zshrc.old';
    mv .zshrc .zshrc.old
  else
    echo '.zshrc is not a normal file. Remove it or back it up and re-run'
    exit 1;
  fi
  ln -s "$install_path/../zshrc" .zshrc
fi
cd $old_dir
