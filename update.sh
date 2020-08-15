#! /bin/bash

cd ~/TrudeOS/

git pull | grep "Already up to date."

if [ $? != 0 ]
then
	echo "[+] A atualizar TrudeOS..."
	./OSconfig.sh
else
	echo "[I] TrudeOS está atualizado."
fi

sudo snap refresh
sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y
sudo apt autoremove -y
sudo apt autoclean -y
