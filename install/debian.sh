sudo apt-get update
sudo apt-get install zsh gtk-redshift tree vim tmux rxvt-unicode curl libcurl4-openssl-dev exuberant-ctags postgresql pgadmin3 libdbd-pg-perl build-essential cpanminus perl perl-doc software-properties-common
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install cabal-install-1.20 ghc-7.8.4 happy-1.19.4 alex-3.1.3

install_path=$(dirname "$PWD/$0")
gconftool-2 --load "$install_path/../gnome-terminal-conf.xml"
