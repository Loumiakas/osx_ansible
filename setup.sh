#!/usr/bin/env bash

# Installing homebrew
if [ ! -f /usr/local/bin/brew  ]; then
	echo "Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install ansible

ansible-playbook --ask-become-pass homebrew.yml
ansible-playbook user_settings.yml
ansible-playbook dotfiles.yml
