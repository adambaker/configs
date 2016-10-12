sudo apt-get update
sudo apt-get install zsh gtk-redshift tree vim tmux rxvt-unicode curl libcurl4-openssl-dev exuberant-ctags postgresql pgadmin3 libpq-dev libdbd-pg-perl build-essential cpanminus perl perl-doc software-properties-common
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install nodejs

install_path=$(dirname "$PWD/$0")
gconftool-2 --load "$install_path/../gnome-terminal-conf.xml"
