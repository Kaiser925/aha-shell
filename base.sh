#!/bin/bash

if [[ $(uname -m | grep '64') ]]; then 
  ARCH=amd64
else
  ARCH=386
fi

OS=$(uname | awk '{print tolower($0)}')