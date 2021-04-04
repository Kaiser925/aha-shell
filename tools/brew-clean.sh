#!/bin/bash

file_count=0
link_count=0
incomplete_count=0

# Clean HomeBrew Cask caches
for cask_link in $(find ~/Library/Caches/Homebrew/Cask -type l)
do
	(( file_count++ ))
    trash $(realpath "$cask_link")
	(( link_count++ ))
    rm "$cask_link"
done

# Clean HomeBrew download cache 
for link in $(find ~/Library/Caches/Homebrew -type l)
do
	(( file_count++ ))
    trash $(realpath "$link")
	(( link_count++ ))
    rm "$link"
done

incomplete_count=$(ls -l ~/Library/Caches/Homebrew/downloads/*.incomplete | wc -l)

rm ~/Library/Caches/Homebrew/downloads/*.incomplete

# 复数输出函数
plural() {
    if [ "$1" -gt 1 ]
    then
        echo "$1 $2s"
    else
        echo "$1 $2"
    fi
}

echo "Pruned $(plural "$link_count" "symbolic link"), $(plural "$file_count" "file") and $(plural "$incomplete_count" "incomplete download") from $(realpath ~/Library/Caches/Homebrew)"

brew cleanup
