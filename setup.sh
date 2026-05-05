#!/bin/bash

# Function to update the repository
update_repository() {
    echo -e "\e[1;34m[*] Updating repository...\e[0m"
    bash update.sh
    echo -e "\e[1;32m[+] Repository updated successfully!\e[0m"
}

# Main script
clear
echo
pkg install pv -y >/dev/null 2>&1

echo -e "\033[32m\033[1m{───────────────────────────────────────────────────}"
echo -e "\033[33m\033[1m   TermIstiack: Full System Setup! Please Wait..." | pv -qL 15
echo -e "\033[32m\033[1m{───────────────────────────────────────────────────}"

# 1. System Update & Upgrade
echo -e "\e[1;34m[*] Updating system packages...\e[0m"
apt update -y && apt upgrade -y
pkg update -y && pkg upgrade -y

# 2. Comprehensive Package Installation
echo -e "\e[1;34m[*] Installing all required packages...\e[0m"
pkg install python python2 python3 git php bash nano nodejs ruby mpv termux-api ncurses-utils wget curl cmatrix pv figlet -y

# 3. Python Libraries (Pip & Pip2)
echo -e "\e[1;34m[*] Installing Python libraries...\e[0m"
# Python 3
pip install --upgrade pip
pip install rich requests mechanize lolcat bs4 httpx
# Python 2 (Attempting install if supported)
pip2 install requests mechanize bs4 futures 2>/dev/null

# 4. Storage Setup
echo -e "\e[1;34m[*] Setting up storage...\e[0m"
termux-setup-storage

# 5. Custom Aliases (Shortcuts)
echo "alias istiack='cd ~/TermIstiack'" >> $HOME/.bashrc
echo "alias cls='clear'" >> $HOME/.bashrc
echo "alias up='apt update && apt upgrade -y'" >> $HOME/.bashrc

# 6. Automatic Update on New Session (Injecting into login.sh process)
# We will add the update command to the top of login.sh so it runs every session
sed -i '16i apt update && apt upgrade -y' login.sh 2>/dev/null

echo -e "\n\033[31m\033[1m        INSTALLATION COMPLETED \033[32m[\033[36m✓\033[32m]" | pv -qL 12
echo -e "\033[33m\033[1m]────────────────────────────────────────────["

# 7. Directory and File Management
cd $HOME/TermIstiack
chmod +x login.sh delete.sh setup.sh sound_effect.py banner.sh update.sh network.py

# Organizing Media & Scripts
mkdir -p Song
mv Access-Granted.mp3 Jarvis2.mp3 JARVIS.mp3 Song/ 2>/dev/null
mkdir -p NETWORK
mv network.py NETWORK/ 2>/dev/null

# 8. Finalizing Login Setup
cp login.sh $PREFIX/etc
rm -rf $PREFIX/etc/motd

# Optional Update Prompt
echo
read -p "Do you want to check for repository updates now? (y/n): " choice
if [ "$choice" = "y" ]; then
    update_repository
fi

# Run login script to set username/password
bash login.sh
