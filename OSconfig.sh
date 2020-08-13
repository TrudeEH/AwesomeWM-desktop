#! /bin/bash

# -------------------------------------------------

echo "[I] AVISO: Testado apenas com Ubuntu Minimal 18.04!"
echo "[I] Aperte enter para continuar."
read

echo "[+] A atualizar repo..."
sudo apt update -y &> /dev/null
echo "[+] A atualizar programas..."
sudo apt upgrade -y &> /dev/null
echo "[+] A atualizar distro..."
sudo apt dist-upgrade -y &> /dev/null
echo "[+] A remover dependências.."
sudo apt autoremove -y &> /dev/null
echo "[+] A limpar cache..."
sudo apt autoclean -y &> /dev/null

# --------------------------------------------------

echo "[+] A instalar pacotes..."
sudo apt install gparted kmix network-manager firefox telegram-desktop flameshot vim alsa-utils wicd-curses htop git pcmanfm nano pavucontrol snapd -y &> /dev/null

echo "[+] A instalar python..."
sudo apt install -y python3-tk python3 python3-pip python python-pip >/dev/null

echo "[+] A instalar GUI..."
sudo apt install dmenu slim xorg awesome xterm compton -y &> /dev/null

echo "[+] A instalar wine..."
sudo apt install wine-stable mono-complete -y &> /dev/null

echo "[+] A configurar rede..."
curl -s https://install.zerotier.com | sudo bash &> /dev/null
sudo zerotier-cli join 9f77fc393ebe610a &> /dev/null

echo "[+] A instalar wifite..."
# Bully:
sudo apt-get -y install reaver libpcap-dev libssl-dev aircrack-ng
git clone https://github.com/aanarchyy/bully
cd bully*/
cd src/
make
sudo make install
cd ../..
rm -rf bully*/
sudo apt install pyrit hashcat macchanger -y
# HCX---
git clone https://github.com/ZerBea/hcxdumptool.git
cd hcxdumptool
sudo apt-get install libcurl4-openssl-dev -y
sudo apt-get install libssl-dev -y
make
sudo make install
cd ..
rm -rf hcxdumptool
git clone https://github.com/ZerBea/hcxtools.git
cd hcxtools
make
sudo make install
cd ..
rm -rf hcxtools
# Wifite2
git clone https://github.com/derv82/wifite2.git
cd wifite2
sudo python3 setup.py install
cd ..
sudo rm -rf wifite2

echo "[+] A instalar dependências do ambiente..."
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 -y &> /dev/null
sudo apt-get install -y fonts-font-awesome
git clone https://github.com/jaagr/polybar.git &> /dev/null
echo "[I] Por favor aceite as opções (y):"
cd polybar && ./build.sh > /dev/null
cd .. && rm -rf polybar

echo "[+] A configurar ambiente..."
mkdir ~/.config/awesome &> /dev/null
mkdir ~/.config/polybar &> /dev/null
mkdir ~/.fonts &> /dev/null
mkdir ~/.local/share/fonts &> /dev/null
echo "xterm*font:     *-fixed-*-*-*-18-*" > ~/.Xresources # Change terminal font size
rm ~/.config/awesome/rc.lua
rm ~/.config/awesome/theme.lua
rm ~/.config/awesome/wallpaper.png
rm -rf ~/.config/polybar/*
rm -rf ~/.fonts/*
rm -rf ~/.local/share/fonts/*
cp rc.lua ~/.config/awesome
cp theme.lua ~/.config/awesome
cp wallpaper.png ~/.config/awesome
cp -r fonts/* ~/.fonts
cp -r fonts/* ~/.local/share/fonts/
cp config ~/.config/polybar
cp vimrc ~/.vimrc

echo "[+] A preparar segurança..."
cp seclevel.sh /$HOME/.config/polybar/
sudo apt install -y gufw macchanger proxychains > /dev/null


echo "Notas ;)"

echo "[I] Ficheiro de configuração: ~/.config/awesome/rc.lua"

echo "[I] Ficheiro de configuração do tema/background: ~/.config/awesome/theme.lua"

# Notas:
# amixer -D pulse sset Master 50%  -> Regula o volume
# sudo wicd-curses                 -> Ligar a rede Wifi
# htop                             -> gestor de tarefas
# pcmanfm                          -> GUI para gerir ficheiros
# nano                             -> editor de texto

