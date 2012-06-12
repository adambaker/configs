#!/bin/bash
old_dir=$PWD
cd
git clone https://github.com/sigurdga/gnome-terminal-colors-solarized.git
cd gnome-terminal-colors-solarized
./set_light.sh
wget --no-check-certificate https://raw.github.com/seebi/dircolors-solarized/master/dircolors.ansi-light
mv dircolors.ansi-light .dircolors
eval `dircolors ~/.dircolors`
cd $old_dir
