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
apt-get install -y xclip
apt-get install -y ripgrep

apt-get install -y nodejs npm
apt-get install n -g
fi

if [ ! -d $HOME_USR/.local/share/fonts/hack ];then
  echo $HOME_USR
  echo "install some icons..."
  mkdir -p $HOME_USR/.local/share/fonts/hack
  unzip -o Hack.zip -d $HOME_USR/.local/share/fonts/hack
  fc-cache -f -v > /dev/null
  echo "install icons successed"
fi

echo "install nvim..."
[[ ! -f /usr/bin/nvim.appimage ]] &&  cp nvim.appimage /usr/bin/
chmod +x /usr/bin/nvim.appimage
if [ -f /usr/bin/nvim ];then
  rm /usr/bin/nvim
fi

ln -s /usr/bin/nvim.appimage /usr/bin/nvim

cat $HOME_USR/.bashrc |grep "alias vim='nvim'"
if [ $? -eq 1 ];then
  echo "alias vim='nvim'" >> $HOME_USR/.bashrc
fi

cp -pr .config/* $HOME_USR/.config/
cp -pr .local/* $HOME_USR/.local/


if [[ -f $HOME_USR/.local/share/nvim/site/pack/packer/start/plugin.tar.gz 
    && ! -f $HOME_USR/.local/share/nvim/site/pack/packer/start/.installed ]];then
  tar -xzvf $HOME_USR/.local/share/nvim/site/pack/packer/start/plugin.tar.gz -C $HOME_USR/.local/share/nvim/site/pack/packer/start/
  touch $HOME_USR/.local/share/nvim/site/pack/packer/start/.installed
fi

if [ ! -f .installed ];then
  touch .installed
fi
echo "install nvim successed"
