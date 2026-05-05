#!/bin/bash
# Theme Changer Engine

clear
echo -e "\e[1;36m=========================================\e[0m"
echo -e "\e[1;33m       TermIstiack Theme Manager       \e[0m"
echo -e "\e[1;36m=========================================\e[0m"
echo -e "\e[1;32m[1] Matrix Green\e[0m"
echo -e "\e[1;34m[2] Ocean Blue\e[0m"
echo -e "\e[1;31m[3] Hacker Red\e[0m"
echo -e "\e[1;35m[4] Cyberpunk Purple\e[0m"
echo -e "\e[1;37m[5] Minimalist White\e[0m"
echo -e "\e[1;33m[0] Cancel\e[0m"
echo

read -p $'\e[1;36mSelect your vibe (0-5): \e[0m' color_choice

# Getting the name from the existing theme file
CURRENT_NAME=$(grep -oP '(?<=\[%F{white}).*?(?=%F)' ~/.istiack_theme | head -1)
if [ -z "$CURRENT_NAME" ]; then CURRENT_NAME="Istiack"; fi

case $color_choice in
    1) C="green";;
    2) C="blue";;
    3) C="red";;
    4) C="magenta";;
    5) C="white";;
    0) echo "Cancelled."; exit;;
    *) echo "Invalid Option"; exit;;
esac

# Updating the theme file dynamically
echo "PROMPT=$'%B%F{$C}┌─[%F{white}%T%F{$C}]─────[%F{white}${CURRENT_NAME}%F{$C}]───[%F{209}%!%F{$C}]\n|\n└─[%F{yellow}%~%F{$C}]────►%F{cyan} %b'" > ~/.istiack_theme

echo -e "\e[1;32m[+] Theme Applied Successfully!\e[0m"
# Reloading the shell to apply instantly
exec zsh
