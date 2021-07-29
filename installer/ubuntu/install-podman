#!/bin/sh

set -e

version=$(cat /etc/os-release | grep ^VERSION_ID= | awk -F '=' '{ print $2}' | tr -d \")
min="20.10"

if [ 1 -eq "$(echo "${version} < ${min}" | bc)" ]; then
  echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/testing/xUbuntu_$version/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:testing.list
  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/testing/xUbuntu_$version/Release.key | sudo apt-key add -
sudo apt-get update -qq
fi

sudo apt update
sudo apt upgrade
sudo apt install podman -y

