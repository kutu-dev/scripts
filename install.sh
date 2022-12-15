#!/usr/bin/env sh

if [ "$UID" -eq 0 -o "$EUID" -eq 0 ];
then
    for file in $(find ~/documents/dev/scripts -maxdepth 1 -mindepth 1 ! -name 'install.sh' ! -name 'dependencies.txt' ! -name '.git' ! --name 'README.md')
    do
        filename=${file##*/}
        cp $file /usr/local/bin/${filename%.*}
        chmod u+x /usr/local/bin/${filename%.*}
    done
else
    echo "Please run this script with sudo: 'sudo $0$*'"
fi
