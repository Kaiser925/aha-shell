#!/bin/bash

# Golang-install will install go with version.
# If you are upgrading from an older version of Go 
# this will first remove the existing version.

# import base.sh
. base.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

read -p 'version: ' VERSION

if [ -d '/usr/local/go' ]; then
  echo remove the existing version. 
  sudo rm -rf /usr/local/go
fi

pkg=go$VERSION.$OS-$ARCH.tar.gz

url=https://dl.google.com/go/$pkg

wget $url

tar -C /usr/local -xzf $pkg

echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile && source $HOME/.profile