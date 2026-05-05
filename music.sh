#!/bin/bash

clear
echo -e "\e[1;35m♫=======================================♫\e[0m"
echo -e "\e[1;32m       TermIstiack Background Player     \e[0m"
echo -e "\e[1;35m♫=======================================♫\e[0m"
echo -e "\e[1;36m[1] Play Music (Continuous Loop)\e[0m"
echo -e "\e[1;31m[2] Stop Music\e[0m"
echo -e "\e[1;33m[0] Exit Menu\e[0m"
echo

read -p $'\e[1;36mSelect Option: \e[0m' opt

case $opt in
    1)
        if ls $HOME/TermIstiack/.music/*.mp3 1> /dev/null 2>&1; then
            pkill -f "mpv --loop-playlist" 2>/dev/null
            echo -e "\e[1;32m[+] Playing music from hidden matrix (.music). Enjoy your session!\e[0m"
            nohup mpv --loop-playlist=inf $HOME/TermIstiack/.music/*.mp3 --no-video > /dev/null 2>&1 &
        else
            echo -e "\e[1;31m[!] No .mp3 files found!\e[0m"
            echo -e "\e[1;33m[*] Please add m1.mp3, m2.mp3 to TermIstiack/.music/ folder.\e[0m"
        fi
        ;;
    2)
        echo -e "\e[1;31m[*] Stopping music...\e[0m"
        pkill -f "mpv --loop-playlist" 2>/dev/null
        ;;
    0) exit ;;
    *) echo "Invalid." ;;
esac
