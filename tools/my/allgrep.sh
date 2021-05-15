#!/bin/bash
files=$(ls $2) 
count=$(echo $files | wc -w)
for ((i=1; i<=$count; i++))
do
 file=$(echo $files | awk -F" " "{print \$$i}")
 (grep -Eas $1 $file || grep -Easf $1 $file ) | sed "s,$1,$(tput setaf 1)&$(tput sgr0),"
 if [ -z "$out" ];then echo -e "\033[0;31m$file\033[0m";fi
 #echo -e "\033[0;31m$file\033[0m"a
done
