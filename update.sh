#! /bin/bash

cd ~/TrudeOS/

git checkout | grep "Your branch is up to date with 'origin/master'."

if [ $? != 0 ]
then
	echo "[+] A atualizar TrudeOS..."
	git pull origin master
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
