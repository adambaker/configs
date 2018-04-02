#!/bin/bash
sudo pip install setuptools
sudo pip install neovim websocket-client sexpdata
sudo pip3 install setuptools
sudo pip3 install neovim

install_path=$(dirname "$PWD/$0")
source "$install_path/helper.sh";

old_dir=$PWD
cd
link_config vimrc $install_path
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p .config/nvim
cd .config/nvim
link_config nvim-init $install_path
mv .nvim-init init.vim
cd $old_dir
nvim +PlugInstall +qall && nvim +UpdateRemotePlugins +qall
