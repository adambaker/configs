sudo apt-get install zsh gtk-redshift tree vim tmux rxvt-unicode curl exuberant-ctags postgresql pgadmin3 libdbd-pg-perl build-essential cpanminus perl perl-doc
install_path=$(dirname "$PWD/$0")
gconftool-2 --load "$install_path/../gnome-terminal-conf.xml"
