#!/usr/bin/env bash

input="${@:2}"
cmd="ssh -N"

for port in $input; do
  cmd="$cmd -L $port:localhost:$port"
done

cmd="$cmd $1"

echo $cmd

${cmd}