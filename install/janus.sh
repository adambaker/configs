#!/bin/bash
for prereq in curl rake
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
  if [ -e ".$fn" ]; then
    if [ -h ".$fn" ]; then
      echo "Deleting .$fn link.";
      rm ".$fn"
    else
      if [ -f .zshrc ]; then 
        echo "Backing up .$fn as .$fn.old";
        mv ".$fn" ".$fn.old"
      else
        echo ".$fn is not a normal file. Remove it or back it up and re-run"
        exit 1;
      fi
    fi
  fi
  ln -s "$install_path/../$fn" ".$fn"
done
 
echo 'adding bufkill plugin'
mkdir .janus
cd .janus
git clone https://github.com/vim-scripts/bufkill.vim.git bufkill
cd $old_dir
