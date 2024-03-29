#!/usr/bin/env bash

if ! command -v git >/dev/null; then
	echo "git not installed. Please install it."
 	exit 1
fi

if ! command -v bash >/dev/null; then
	echo "bash not installed. Please install it."
  exit 1
fi

echo "##############################" 
echo "### Start the installation ###" 
echo "##############################" 
sleep 0.5

clear

printf "Hey. This script can overwrite these files; \n~/.bashrc \n~/.beubash (if exists) \nIf you are sure, wait please." 
sleep 2

rm -rf ~/.beubash 2>/dev/null

echo "Cloning the repo." 
git clone https://github.com/Quitaxd/beubash ~/.beubash

if [ "$1" == "--dev" ]; then
	echo "Switching to dev branch."
	cd ~/.beubash
	git checkout dev
	cd -
 fi

clear

echo "Removing ~/.bashrc" 
mv ~/.bashrc ~/.old.bashrc_before_beubash
sleep 1

clear

ln -s ~/.beubash/.bashrc ~/.bashrc

clear

echo "Installation has been completed!" 
sleep 1

clear 

echo "NOTE: You can put your aliases into $HOME/.config/aliasrc"
builtin source ~/.bashrc
echo "If beubash was not activated, please close this terminal and open a new terminal."
