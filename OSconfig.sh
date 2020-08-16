#! /bin/bash

# -------------------------------------------------

sudo echo

echo "[+] A instalar TrudeOS..."

# Atualizar base do sistema:
echo -ne '[.........................]\r'
sudo apt update -y &> /dev/null
echo -ne '[#........................]\r'
sudo apt upgrade -y &> /dev/null
echo -ne '[##.......................]\r'
sudo apt dist-upgrade -y &> /dev/null
echo -ne '[###......................]\r'
sudo apt autoremove -y &> /dev/null
echo -ne '[####.....................]\r'
sudo apt autoclean -y &> /dev/null
echo -ne '[#####....................]\r'

# --------------------------------------------------

# Instalar pacotes:
sudo apt install gparted kmix network-manager-gnome network-manager firefox telegram-desktop flameshot vim alsa-utils wicd-curses htop git pcmanfm nano pavucontrol snapd -y &> /dev/null
echo -ne '[#########................]\r'

# Instalar python:
sudo apt install -y python3-tk python3 python3-pip python python-pip &>/dev/null
echo -ne '[############.............]\r'

# Instalar GUI:
sudo apt install dmenu slim xorg awesome xterm compton -y &> /dev/null
echo -ne '[##############...........]\r'

# Instalar wine:
sudo apt install wine-stable mono-complete -y &> /dev/null
echo -ne '[################.........]\r'

# Instalar wifite:
# Bully:
sudo apt-get -y install reaver libpcap-dev libssl-dev aircrack-ng &> /dev/null
git clone https://github.com/aanarchyy/bully &> /dev/null
cd bully*/
cd src/
make &> /dev/null
sudo make install &> /dev/null
cd ../..
rm -rf bully*/
sudo apt install pyrit hashcat macchanger -y &> /dev/null
# HCX---
git clone https://github.com/ZerBea/hcxdumptool.git &> /dev/null
cd hcxdumptool
sudo apt-get install libcurl4-openssl-dev -y &> /dev/null
sudo apt-get install libssl-dev -y &> /dev/null
make &> /dev/null
sudo make install &> /dev/null
cd ..
rm -rf hcxdumptool
git clone https://github.com/ZerBea/hcxtools.git &> /dev/null
cd hcxtools
make &> /dev/null
sudo make install &> /dev/null
cd ..
rm -rf hcxtools
# Wifite2
git clone https://github.com/derv82/wifite2.git &> /dev/null
cd wifite2
sudo python3 setup.py install &> /dev/null
cd ..
sudo rm -rf wifite2
echo -ne '[####################.....]\r'

# Instalar dependências do ambiente:
sudo apt-get install cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 -y &> /dev/null
echo -ne '[######################...]\r'
echo -ne '\n'
cd polybar && ./build.sh &> /dev/null
cd ..
echo -ne '[#########################]\r'
echo -ne '\n'

# Configurar ambiente:
mkdir ~/.config &> /dev/null
mkdir ~/.config/awesome &> /dev/null
mkdir ~/.config/polybar &> /dev/null
mkdir ~/.fonts &> /dev/null
mkdir ~/.local &> /dev/null
mkdir ~/.local/share &> /dev/null
mkdir ~/.local/share/fonts &> /dev/null
echo "xterm*font:     *-fixed-*-*-*-18-*" > ~/.Xresources # Change terminal font size
rm ~/.config/awesome/rc.lua &> /dev/null
rm ~/.config/awesome/theme.lua &> /dev/null
rm ~/.config/awesome/wallpaper.png &> /dev/null
rm -rf ~/.config/polybar/* &> /dev/null
rm -rf ~/.fonts/* &> /dev/null
rm -rf ~/.local/share/fonts/* &> /dev/null
cp rc.lua ~/.config/awesome
cp theme.lua ~/.config/awesome
cp wallpaper.png ~/.config/awesome
cp -r fonts/* ~/.fonts
cp -r fonts/* ~/.local/share/fonts/
cp config ~/.config/polybar
cp vimrc ~/.vimrc

sudo apt install -y gufw macchanger proxychains &> /dev/null

echo "[I] TrudeOS foi instalado! Pode reiniciar o computador."

# Notas:
# amixer -D pulse sset Master 50%  -> Regula o volume
# sudo wicd-curses                 -> Ligar a rede Wifi
# htop                             -> gestor de tarefas
# pcmanfm                          -> GUI para gerir ficheiros
# nano                             -> editor de texto

