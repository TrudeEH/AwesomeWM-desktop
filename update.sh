#! /bin/bash

cd ~/TrudeOS/

git pull | grep "Already up to date." &> /dev/null

if [ $? != 0 ]
then
	echo "[+] Updating TrudeOS..."
	./OSconfig.sh
else
	echo "[I] TrudeOS is up to date."
fi

sudo snap refresh
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
