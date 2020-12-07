#! /bin/bash

# -------------------------------------------------

sudo echo

echo "[+] Installing TrudeOS..."

# Update base:
echo
echo "[+] Updating the system base..."
echo -ne '[.........................]\r'
sudo apt update -y &> /dev/null
echo -ne '[#####....................]\r'
sudo apt upgrade -y &> /dev/null
echo -ne '[##########...............]\r'
sudo apt dist-upgrade -y &> /dev/null
echo -ne '[################.........]\r'
sudo apt autoremove -y &> /dev/null
echo -ne '[#####################....]\r'
sudo apt autoclean -y &> /dev/null
echo -ne '[#########################]\r'
echo -ne '\n'
echo
# --------------------------------------------------

# Install packages:
echo
echo "[+] Installing packages..."
echo -ne '[.........................]\r'
sudo apt install -y firefox-esr &> /dev/null
sudo apt install -y firefox &> /dev/null
echo -ne '[###......................]\r'
sudo apt install -y gparted network-manager-gnome network-manager telegram-desktop flameshot vim alsa-utils wicd-curses htop git pcmanfm nano pavucontrol &> /dev/null
echo -ne '[#######..................]\r'
sudo apt install -y python3-tk python3 python3-pip python python-pip &> /dev/null
echo -ne '[###########..............]\r'
sudo apt install -y dmenu slim xorg awesome xterm plymouth compton &> /dev/null
echo -ne '[################.........]\r'
sudo apt install -y gufw macchanger proxychains deja-dup duplicity &> /dev/null
echo -ne '[#####################....]\r'
sudo apt install -y unifont cmake cmake-data libcairo2-dev libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-image0-dev libxcb-randr0-dev libxcb-util0-dev libxcb-xkb-dev pkg-config python-xcbgen xcb-proto libxcb-xrm-dev libasound2-dev libmpdclient-dev libiw-dev libcurl4-openssl-dev libpulse-dev libxcb-composite0-dev xcb libxcb-ewmh2 &> /dev/null
echo -ne '[#########################]\r'
echo -ne '\n'

# Install wifite:
# Bully:
echo
echo "[+] Installing wifite..."
echo -ne '[#........................]\r'
sudo apt-get -y install reaver libpcap-dev libssl-dev aircrack-ng &> /dev/null
echo -ne '[####.....................]\r'
git clone https://github.com/aanarchyy/bully &> /dev/null
echo -ne '[######...................]\r'
cd bully*/
cd src/
make &> /dev/null
echo -ne '[#######..................]\r'
sudo make install &> /dev/null
echo -ne '[########.................]\r'
cd ../..
rm -rf bully*/ &> /dev/null
sudo apt install pyrit hashcat macchanger -y &> /dev/null
echo -ne '[##########...............]\r' 
# HCX---
git clone https://github.com/ZerBea/hcxdumptool.git &> /dev/null
echo -ne '[############.............]\r' 
cd hcxdumptool
sudo apt-get install libcurl4-openssl-dev -y &> /dev/null
echo -ne '[##############...........]\r' 
sudo apt-get install libssl-dev -y &> /dev/null
echo -ne '[###############..........]\r'
make &> /dev/null
echo -ne '[################.........]\r'
sudo make install &> /dev/null 
echo -ne '[#################........]\r'
cd ..
rm -rf hcxdumptool
git clone https://github.com/ZerBea/hcxtools.git &> /dev/null
echo -ne '[##################.......]\r'
cd hcxtools
make &> /dev/null
echo -ne '[###################......]\r'
sudo make install &> /dev/null
echo -ne '[####################.....]\r'
cd ..
rm -rf hcxtools
# Wifite2
git clone https://github.com/derv82/wifite2.git &> /dev/null
cd wifite2
echo -ne '[######################...]\r'
sudo python3 setup.py install &> /dev/null
echo -ne '[########################.]\r'
cd ..
sudo rm -rf wifite2
cd ~/TrudeOS
echo -ne '[#########################]\r'
ecgo -ne '\n'

# Polybar
sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf ; fc-cache &> /dev/null
git clone https://github.com/jaagr/polybar.git
cd polybar && ./build.sh -A -a -p -n -c
cd ..
rm -rf polybar

# Settings:
mkdir ~/.config &> /dev/null
mkdir ~/.config/awesome &> /dev/null
mkdir ~/.config/polybar &> /dev/null
mkdir ~/.fonts &> /dev/null
mkdir ~/.local &> /dev/null
mkdir ~/.local/share &> /dev/null
mkdir ~/.local/share/fonts &> /dev/null

rm ~/.Xresources
rm ~/.config/awesome/rc.lua &> /dev/null
rm ~/.config/awesome/theme.lua &> /dev/null
rm ~/.config/awesome/wallpaper.png &> /dev/null
rm -rf ~/.config/polybar/* &> /dev/null
rm -rf ~/.fonts/* &> /dev/null
rm -rf ~/.local/share/fonts/* &> /dev/null
rm ~/.vimrc &> /dev/null
sudo rm -rf /usr/share/slim/themes/tslim &> /dev/null
sudo rm /etc/slim.conf &> /dev/null
rm ~/.bashrc &> /dev/null

cp rc.lua ~/.config/awesome
cp theme.lua ~/.config/awesome
cp wallpaper.png ~/.config/awesome
cp -r fonts/* ~/.fonts
cp -r fonts/* ~/.local/share/fonts/
cp config ~/.config/polybar
cp vimrc ~/.vimrc
sudo cp -r tslim/ /usr/share/slim/themes
sudo cp slim.conf /etc/slim.conf
cp Xresources ~/.Xresources
cp bashrc ~/.bashrc

xrdb -merge ~/.Xresources

# Drivers:
echo "[+] Installing drivers..."
echo -ne '[.........................]\r'
sudo cat sources | sudo tee /etc/apt/sources.list &> /dev/null
echo -ne '[########.................]\r'
sudo apt update &> /dev/null
echo -ne '[###############..........]\r'

cat /proc/cpuinfo | grep 'Intel' &> /dev/null
if [ $? == 0 ]
then
    sudo apt install intel-microcode -y &> /dev/null
else
    sudo apt install amd64-microcode -y &> /dev/null
fi

sudo apt install firmware-iwlwifi firmware-realtek -y &> /dev/null
echo -ne '[#########################]\r'
echo -ne '\n'

echo
echo "[I] TrudeOS has been installed! You can restart your computer."
