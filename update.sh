#! /bin/bash

cd ~/TrudeOS/


git fetch
HEADHASH=$(git rev-parse HEAD)
UPSTREAMHASH=$(git rev-parse master@{upstream})

if [ "$HEADHASH" != "$UPSTREAMHASH" ]
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
