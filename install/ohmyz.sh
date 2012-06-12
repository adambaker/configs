#!/bin/bash
install_path=$(dirname "$PWD/$0")
source "$install_path/helper.sh";
if [ -z `which zsh` ]; then 
  echo 'You must install zsh first. Try sudo apt-get install zsh.';
  exit 1;
fi

old_dir=$PWD
cd
wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

link_config zshrc $install_path
cd $old_dir
