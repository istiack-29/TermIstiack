#!/usr/bin/bash 

bash banner.sh
echo

# শুরুতে ইউজারের থেকে তথ্য নেওয়া (সেটআপের সময়)
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' username                
read -p $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password 
echo
echo
read -p $'\033[1m\033[32m  Your \033[0mShell \033[38;5;209mName\033[31m: \033[33m\033[1m ' names
cd                                                   
cd ..                                               
cd usr/etc                                       
rm motd                                           
rm bash.bashrc                                       

# bash.bashrc ফাইল তৈরি করা যা প্রতি সেশনে রান হবে
cat <<LOGIN>bash.bashrc                            

# Ctrl+C দিয়ে যেন কেউ লগইন স্কিপ করতে না পারে
trap '' 2                                          

# প্রতি সেশনে অটো-আপডেট (আপনার রিকোয়ারমেন্ট অনুযায়ী)
echo -e "\e[1;34m[*] Checking for system updates...\e[0m"
apt update && apt upgrade -y
clear

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
\033[31m           ────────────────────────────


\e[0m"
echo
read -p $'       \e[33m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mUSERNAME FOR LOGIN:\033[32m ' user
read -s -p $'       \e[32m\033[1m\033[33m[\033[31m+\033[33m] \033[37mINPUT \033[33mPASSWORD FOR LOGIN:\033[33m ' pass                                                

if [[ \$pass == $password && \$user == $username ]]; then
    sleep 1
    clear
    cd \$HOME
    cd TermIstiack
    # বুটিং সাউন্ড এবং ইন্টারফেস
    python sound_effect.py
    clear
    cd \$HOME 
    echo -e "\033[1m\033[33m

██╗███████╗████████╗██╗ █████╗  ██████╗██╗  ██╗
██║██╔════╝╚══██╔══╝██║██╔══██╗██╔════╝██║ ██╔╝
██║███████╗   ██║   ██║███████║██║     █████╔╝ 
██║╚════██║   ██║   ██║██╔══██║██║     ██╔═██╗ 
██║███████║   ██║   ██║██║  ██║╚██████╗██║  ██╗
╚═╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝

"
    echo -e  "     \e[1m\e[32m▂▃▄▅▆▇▓▒░ \033[1mCoded By \e[33mIstiack \e[1m\e[32m░▒▓▇▆▅▄▃▂"
    echo -e "   \033[1m\033[33m]\033[31m──────────────────────────────────────\033[33m["
    echo 

    # কাস্টম সেল প্রম্পট (PS1) আপনার নাম সহ
    PS1='\033[1m\[\e[32m\]\033[1m┌─[\[\e[37m\]\T\[\e[32m\]\033[1m]─────\033[1m\e[1;98m\[[\033[1m\033[37m$names\033[32m]\033[1m\e[0;32m\033[1m───[\033[38;5;209m\#\033[32m]\n|\n\033[1m\e[0;32m\033[1m└─[\[\e[32m\]\e[1;33m\W\[\e[1m\033[32m]\033[1m────►\e[1;36m\033[1m '

    # কাজের সুবিধার জন্য কিছু অ্যালিয়াস (Aliases)
    alias istiack='cd ~/TermIstiack'
    alias cls='clear'
    alias up='apt update && apt upgrade -y'

    cd \$HOME
    cd TermIstiack
else
    echo ""
    echo -e "\e[1;31m  You Entered wrong Details! 
\e[0m"
    sleep 1
    # ভুল পাসওয়ার্ড দিলে ম্যাট্রিক্স ইফেক্ট
    cmatrix -L
    exit
fi
trap 2
LOGIN

echo 
echo
echo 
echo -e "\033[1m\e[1;32m Your Termux is \033[33mReady \n
       So please \033[31mExit \033[37mand \033[32mLogin.\e[0m"
echo
echo