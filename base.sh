#!/bin/bash


# base::get_arch_bits() return '64' if system is 64 bits,
# else return 32.
function base::get_arch_bits() {
  if [[ $(uname -m | grep '64') ]]; then 
    return 64
  else
    return 36
  fi
}