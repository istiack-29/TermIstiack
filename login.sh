#!/usr/bin/bash 

bash banner.sh
echo

# ইউজার থেকে ইনপুট নেওয়া
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' username                
read -p $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password 
echo
read -p $'\033[1m\033[32m  Your \033[0mShell \033[38;5;209mName\033[31m: \033[33m\033[1m ' names

# নতুন .zshrc ফাইল তৈরি শুরু (যাতে আপনার কাস্টম প্রোম্পট ফিক্স থাকে)
cat <<EOF > $HOME/.zshrc
export ZSH="\$HOME/.oh-my-zsh"

# বাগ ফিক্স: ডিফল্ট থিম যাতে আপনার ডিজাইন নষ্ট না করে
ZSH_THEME="" 

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
trap '' 2
attempts=3

# ব্যাকগ্রাউন্ড নয়েজ বন্ধ
unsetopt MONITOR

# সাইলেন্টলি ব্যাকগ্রাউন্ডে আপডেট চেক
(cd \$HOME/TermIstiack && git fetch &>/dev/null) & disown

clear
# লগইন লক স্ক্রিন আর্ট
echo -e "\e[1;32m      
░▒▓█▓▒░      ░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓███████▓▒░  
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒▒▓███▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓█▓▒░     ░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
░▒▓████████▓▒░▒▓██████▓▒░ ░▒▓██████▓▒░░▒▓█▓▒░▒▓█▓▒░░▒▓█▓▒░ 
\033[31m           ────────────────────────────
\033[33m               Login To \033[32mContinue
\033[31m           ────────────────────────────\e[0m"

while [ \$attempts -gt 0 ]; do
    echo -ne "       \e[33m\033[1m[\033[31m+\033[33m] \033[37mUSERNAME:\033[32m "
    read user
    echo -ne "       \e[32m\033[1m[\033[31m+\033[33m] \033[37mPASSWORD:\033[33m "
    read -s pass
    echo ""

    if [[ "\$user" == "$username" && "\$pass" == "$password" ]]; then
        clear
        # অডিও ফিক্স: সরাসরি মেইন ডিরেক্টরি থেকে বাজবে
        mpv --no-video \$HOME/TermIstiack/Access-Granted.mp3 &>/dev/null
        clear
        
        # স্বাগতম আর্ট
        echo -e "\e[1;32m
  _____                   ___     _   _            _    
 |_   _|__ _ __ _ __ ___ |_ _|___| |_(_) __ _  ___| | __
   | |/ _ \ '__| '_ \' _ \ | |/ __| __| |/ _\' |/ __| |/ /
   | |  __/ |  | | | | | | | |\__ \ |_| | (_| | (__|   < 
   |_|\___|_|  |_| |_| |_|___|___/\__|_|\__,_|\___|_|\_\\\ \e[0m"
        
        echo -e "      \e[1;33m— \e[1;32m▂▃▄▅▆▇ \e[1;37mCoded By \e[1;33mIstiack \e[1;32m▇▆▅▄▃▂ \e[1;33m—\e[0m"
        echo -e "   \e[1;31m────────────────────────────────────────────\e[0m"
        echo -e "   \e[1;34m[Facebook] \e[1;37m: \e[4;34mhttps://fb.com/anonymous.istiack\e[0m"
        echo -e "   \e[1;35m[Instagram]\e[1;37m : \e[4;35mhttps://instagram.com/anonymous.istiack\e[0m"
        echo -e "   \e[1;36m[Website]  \e[1;37m : \e[4;36mhttps://istiack-29.github.io\e[0m"
        echo -e "   \e[1;31m────────────────────────────────────────────\e[0m"

        # অ্যালিয়াস এবং কমান্ড
        alias istiack='cd ~/TermIstiack'
        alias cls='clear'
        alias theme='bash ~/TermIstiack/change.sh'
        alias music='bash ~/TermIstiack/music.sh'
        
        # সুপার UP কমান্ড: সিস্টেম আপডেট + গিটহাব অটো সিঙ্ক (ফাইল ডিলিট/অ্যাড হবে অটোমেটিক)
        alias up='apt update && apt upgrade -y && cd \$HOME/TermIstiack && git fetch --all && git reset --hard origin/main && chmod +x * && cd \$HOME && clear && echo -e "\e[1;32m[✓] System & GitHub Files Sync Complete!\e[0m"'
        
        # আপনার কাঙ্ক্ষিত প্রোম্পট ফরম্যাট (প্রথমে তারিখ ও সময়, তারপর আপনার নাম)
        PROMPT=\$'%B%F{green}┌─[%F{white}%D{%Y-%m-%d} %*%F{green}]─────[%F{white}${names}%F{green}]\n└─[%F{yellow}%~%F{green}]──►%F{cyan} %b'
        
        trap 2
        cd \$HOME
        break
    else
        ((attempts--))
        if [ \$attempts -eq 0 ]; then
            echo -e "\e[1;31m[!] System Locked!\e[0m"
            cmatrix -L
            exit
        else
            echo -e "\e[1;31m[!] Wrong! \$attempts attempts remaining.\e[0m"
        fi
    fi
done
EOF

echo -e "\033[1m\e[1;32m [✓] Setup Successful! Restart Termux and enjoy.\e[0m"
