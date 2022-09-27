#!/bin/sh
h=$(date +"%H")

if [ $h -gt 6 -a $h -le 12 ]; then
	s="Good morning"
elif [ $h -gt 12 -a $h -le 16 ]; then 
	s="Good afternoon"
elif [ $h -gt 16 -a $h -le 20 ]; then
	s="Good evening"
else
	s="Good night"
fi

echo $s | figlet -f starwars | lolcat
