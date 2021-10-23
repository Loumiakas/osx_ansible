#!/usr/bin/env bash

# Installing homebrew
if [ ! -f /usr/local/bin/brew  ]; then
	echo "Installing homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install ansible
ansible-galaxy collection install geerlingguy.mac

ansible-playbook --ask-become-pass homebrew.yml
ansible-playbook user_settings.yml
ansible-playbook dotfiles.yml
ansible-playbook etc.yml

if [ ! -f ~/Desktop/ideaIU-2019.1.4.dmg ]; then
	cd ~/Desktop
	wget https://download.jetbrains.com/idea/ideaIU-2019.1.4.dmg
	cd -
fi

# nRF
cd ~/Desktop
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
/usr/bin/python get-pip.py
/usr/bin/python3 get-pip.py
/usr/bin/python3 -m pip install pyserial --pre
/usr/bin/python -m pip install pyserial --pre
mkdir -p ~/.config/wireshark/profiles
wget https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-Sniffer/sw/nrfsnifferforbluetoothle300129d2b3.zip
unzip nrfsnifferforbluetoothle300129d2b3.zip
mv  Profile_nRF_Sniffer_Bluetooth_LE ~/.config/wireshark/profiles
mv  extcap  ~/.config/wireshark/


# pip packages
pip3 install rfcat
pip3 install ezntfs
