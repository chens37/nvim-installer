#!/bin/bash

has_root() {
  if [[ $EUID -ne 0 ]];then
    echo "Please use root or sudo to exec the script"
    exit 1
  fi
}


#__main__

has_root

#dependence = (global git nodejs tar zip unzip)

if [ ! -f .installed ];then

apt-get install -y global
apt-get install -y git
apt-get install -y tar
apt-get install -y zip
apt-get install -y unzip
apt-get install -y fuse

apt-get install -y nodejs npm
apt-get install n -g
fi

if [ ! -f ~/.local/share/fonts/hack ];then
  mkdir -p ~/.local/share/fonts/hack
  unzip -o Hack.zip -d ~/.local/share/fonts/hack
  fc-cache -f -v
fi

cp nvim.appimage /usr/bin/
chmod +x /usr/bin/nvim.appimage
if [ -f /usr/bin/nvim ];then
  rm /usr/bin/nvim
fi

ln -s /usr/bin/nvim.appimage /usr/bin/nvim

cat ~/.bashrc |grep "alias vim='nvim'"
if [ $? -eq 1 ];then
  echo "alias vim='nvim'" >> ~/.bashrc
fi

cp -pr .config/* ~/.config/
cp -pr .local/* ~/.local/


if [ -f ~/.local/share/nvim/site/pack/packer/start/plugin.tar.gz ];then
  tar -xzvf ~/.local/share/nvim/site/pack/packer/start/plugin.tar.gz -C ~/.local/share/nvim/site/pack/packer/start/
fi

if [ ! -f .installed ];then
  touch .installed
fi
