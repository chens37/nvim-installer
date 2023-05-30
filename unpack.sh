#!/bin/bash

has_root() {
  if [[ $EUID -ne 0 ]];then
    echo "Please use root or sudo to exec the script"
    exit 1
  fi
}

#__main__
echo $HOME_USR
if [ -d $HOME_USR/.local/share/fonts/hack ];then
    echo "remove hack icons"
    rm -r $HOME_USR/.local/share/fonts/hack
fi

echo "remove nvim"
[[ -f /usr/bin/nvim.appimage ]] && rm  /usr/bin/nvim.appimage

[[ -f /usr/bin/nvim ]] && rm /usr/bin/nvim

cat $HOME_USR/.bashrc |grep "alias vim='nvim'"
if [ $? -eq 0 ];then
    sed -i "s/alias vim='nvim'//g" $HOME_USR/.bashrc
fi

[[ -f $HOME_USR/.config/nvim ]] && rm -r $HOME_USR/.config/nvim
[[ -f $HOME_USR/.local/share/nvim ]] && rm -r $HOME_USR/.local/share/nvim


