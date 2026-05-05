#!/bin/bash

# --- Premium UI Header ---
clear
echo
pkg install pv -y >/dev/null 2>&1

echo -e "\033[32m\033[1m{───────────────────────────────────────────────────}"
echo -e "\033[33m\033[1m   TERMISTIACK v2.0: THE ULTIMATE MASTERPIECE..." | pv -qL 15
echo -e "\033[32m\033[1m{───────────────────────────────────────────────────}"

# 1. Base Core Update
echo -e "\e[1;34m[*] Synchronizing System Repositories...\e[0m"
apt update -y 
apt upgrade -y
pkg update -y
pkg upgrade -y

# 2. Heavy Package Installation
echo -e "\e[1;34m[*] Injecting Power Tools & Languages...\e[0m"
pkg install python python2 git php bash nano nodejs ruby mpv termux-api ncurses-utils wget curl cmatrix pv figlet zsh -y

# 3. Python Environment Setup
echo -e "\e[1;34m[*] Building Python Matrix (Pip3 & Pip2)...\e[0m"
pip install --upgrade pip
pip install rich requests mechanize lolcat bs4 httpx
pip2 install requests mechanize bs4 futures 2>/dev/null

# 4. Zsh Shell Transformation (The Real Game Changer)
echo -e "\e[1;34m[*] Transforming Shell: Bash -> Zsh...\e[0m"
rm -rf ~/.oh-my-zsh
git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth 1

# 5. Installing Premium Plugins
echo -e "\e[1;34m[*] Installing AI-Based Auto-Suggestions...\e[0m"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
echo -e "\e[1;34m[*] Installing Live Syntax Highlighting...\e[0m"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# 6. Switching Shell Engine
echo -e "\e[1;34m[*] Reconfiguring Terminal Entry Point...\e[0m"
chsh -s zsh

# 7. Storage & Hidden Audio Matrix
echo -e "\e[1;34m[*] Initializing Hidden Audio Matrix (.music)...\e[0m"
termux-setup-storage
mkdir -p $HOME/TermIstiack/.music

# 8. Directory & Permission Handler
echo -e "\e[1;34m[*] Granting Execution Permissions...\e[0m"
cd $HOME/TermIstiack
chmod +x login.sh delete.sh setup.sh sound_effect.py banner.sh update.sh network.py change.sh music.sh

# 9. Organizing Assets
echo -e "\e[1;34m[*] Sorting Multimedia Assets...\e[0m"
mkdir -p Song
mv Access-Granted.mp3 Jarvis2.mp3 JARVIS.mp3 Song/ 2>/dev/null
mkdir -p NETWORK
mv network.py NETWORK/ 2>/dev/null

# 10. Cleaning System Junk
rm -rf $PREFIX/etc/motd
rm -rf $PREFIX/etc/bash.bashrc 2>/dev/null

echo -e "\n\033[31m\033[1m        [✓] CORE SYSTEM DEPLOYED SUCCESSFULLY \033[32m" | pv -qL 12
echo -e "\033[33m\033[1m]────────────────────────────────────────────["

# Start the final Gatekeeper
bash login.sh
