#!/bin/bash

# Golang-install will install go with version.
# If you are upgrading from an older version of Go 
# this will first remove the existing version.

if [[ $(uname -m | grep '64') ]]; then 
  _arch=amd64
else
  _arch=386
fi

_os=$(uname | awk '{print tolower($0)}')

function check_cmd() {
    command -v "$1" > /dev/null 2>&1
}

function install() {
  local _pkg _version _url
  read -p 'Which version: ' _version

  uninstall

  echo "Start to install go:$_version... $_arch $_os"

  _pkg=go$_version.$_os-$_arch.tar.gz

  _url=https://dl.google.com/go/$_pkg

  if check_cmd curl; then
    curl $_url --output $_pkg
  elif check_cmd wget; then
    wget $_url
  else
    echo 'No curl or wget'
    exit 1
  fi

  tar -C /usr/local -xzf $_pkg

  echo 'export PATH=$PATH:/usr/local/go/bin' >> $HOME/.profile
}

function uninstall() {
  local _preversion _path
  if ! check_cmd go; then
    echo 'There is no golang.'
    return 1
  fi

  _path=$(which go | awk 'BEGIN{FS="/bin/go"} END{print $1}')
  
  sudo rm -rf $_path

  if [ $_os == "linux" ]; then
    sed -i '/local\/go\/bin/d' $HOME/.profile
  else
    sed -i '' -e '/local\/go\/bin/d' $HOME/.profile
  fi
}

function main() {
  local _action
  if [ "$EUID" -ne 0 ]
    then echo "Please run as root"
    exit
  fi

  echo " Golang installer, what do you want to do.
  1. install/modify golang.
  2. uninstall golang."

  read -p "Input action number: " _action

  case "$_action" in
  "1") 
    echo "Install/Modify Version"
    install ;;
  "2") 
    echo "Uninstall"
    uninstall ;;
  *) 
    echo "Fuck off"
    exit 1;;
  esac

  echo 'Every thing is done, source $HOME/.profile'
}

main