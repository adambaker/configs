#!/bin/bash
install_path=$(dirname "$PWD/$0")
source "$install_path/helper.sh";

old_dir=$PWD
cd
link_config gitignore $install_path
link_config gitconfig $install_path
cd $old_dir
