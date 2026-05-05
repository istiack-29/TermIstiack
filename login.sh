#!/usr/bin/bash 

bash banner.sh
echo

# User Initialization
read -p $'\e[1;32m  Enter \033[33mUsername \033[37mfor \033[32mLogin:\e[0m ' username                
read -p $'\e[1;32m  Enter \033[33mPassword \033[37mfor \033[32mLogin:\e[0m ' password 
echo
read -p $'\033[1m\033[32m  Your \033[0mShell \033[38;5;209mName\033[31m: \033[33m\033[1m ' names

# Theme Generation
echo "PROMPT=$'%B%F{green}┌─[%F{white}%T%F{green}]─────[%F{white}${names}%F{green}]───[%F{209}%!%F{green}]\n|\n└─[%F{yellow}%~%F{green}]────►%F{cyan} %b'" > $HOME/.istiack_theme

# Creating the .zshrc Masterpiece
cat <<EOF > $HOME/.zshrc
export ZSH="\$HOME/.oh-my-zsh"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240"
trap '' 2

# Resetting attempts inside the shell session
attempts=3

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
\033[31m           ────────────────────────────\e[0m"

# Auto-Update logic placed properly
(
    cd \$HOME/TermIstiack
    git fetch &>/dev/null
    LOCAL=\$(git rev-parse @)
    REMOTE=\$(git rev-parse @{u})
    if [ \$LOCAL != \$REMOTE ]; then
        echo -e "\e[1;33m[*] System Update Found! Syncing...\e[0m"
        git pull &>/dev/null
        chmod +x *
    fi
) &

while [ \$attempts -gt 0 ]; do
    echo -ne "       \e[33m\033[1m[\033[31m+\033[33m] \033[37mUSERNAME:\033[32m "
    read user
    echo -ne "       \e[32m\033[1m[\033[31m+\033[33m] \033[37mPASSWORD:\033[33m "
    read -s pass
    echo ""

    if [[ "\$user" == "$username" && "\$pass" == "$password" ]]; then
        clear
        cd \$HOME/TermIstiack
        python sound_effect.py 2>/dev/null
        clear
        echo -e "\033[1m\033[33m
██╗███████╗████████╗██╗ █████╗  ██████╗██╗  ██╗
██║██╔════╝╚══██╔══╝██║██╔══██╗██╔════╝██║ ██╔╝
██║███████╗   ██║   ██║███████║██║     █████╔╝ 
██║╚════██║   ██║   ██║██╔══██║██║     ██╔═██╗ 
██║███████║   ██║   ██║██║  ██║╚██████╗██║  ██╗
╚═╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝\033[0m"
        echo -e "     \e[1m\e[32m▂▃▄▅▆▇▓▒░ \033[1mCoded By \e[33mIstiack \e[1m\e[32m░▒▓▇▆▅▄▃▂"
        echo -e "   \033[1m\033[33m]\033[31m──────────────────────────────────────\033[33m["
        
        source \$HOME/.istiack_theme
        alias istiack='cd ~/TermIstiack'
        alias cls='clear'
        alias up='apt update && apt upgrade -y'
        alias theme='bash ~/TermIstiack/change.sh'
        alias music='bash ~/TermIstiack/music.sh'
        trap 2
        break
    else
        ((attempts--))
        if [ \$attempts -eq 0 ]; then
            echo -e "\e[1;31m[!] System Locked! Intruder detected.\e[0m"
            cmatrix -L
            exit
        else
            echo -e "\e[1;31m[!] Wrong! \$attempts attempts remaining.\e[0m"
        fi
    fi
done
EOF
echo -e "\033[1m\e[1;32m [✓] Setup Successful! Please restart Termux.\e[0m"
