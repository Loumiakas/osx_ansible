#!/usr/bin/env bash

# Installing homebrew
if [ ! -f /usr/local/bin/brew  ]; then
	echo "Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install ansible
ansible-galaxy install geerlingguy.homebrew

ansible-playbook --ask-become-pass homebrew.yml
ansible-playbook user_settings.yml
ansible-playbook dotfiles.yml
ansible-playbook etc.yml

if [ ! -f ~/Desktop/ideaIU-2019.1.4.dmg ]; then
	cd ~/Desktop
	wget https://download.jetbrains.com/idea/ideaIU-2019.1.4.dmg
	cd -
fi
