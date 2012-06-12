#!/bin/bash
install_path=$(dirname "$PWD/$0")
source "$install_path/helper.sh";

for prereq in vomit curl rake
do
  if [ -z `which $prereq` ]; then 
    echo "You must install $prereq first."
    exit 1;
  fi
done
old_dir=$PWD
install_path=$(dirname "$PWD/$0")
cd
curl -Lo- https://bit.ly/janus-bootstrap | bash
echo 'symlinking janus customizations';
for fn in vimrc.after vimrc.before
do
  link_config $fn $install_path
done
 
echo 'adding bufkill plugin'
mkdir .janus
cd .janus
git clone https://github.com/vim-scripts/bufkill.vim.git bufkill
cd $old_dir
