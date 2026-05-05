#!/bin/bash

# --- Premium UI Header ---
clear
echo
pkg install pv -y >/dev/null 2>&1

echo -e "\033[32m\033[1m{───────────────────────────────────────────────────}"
echo -e "\033[33m\033[1m   TERMISTIACK" | pv -qL 15
echo -e "\033[32m\033[1m{───────────────────────────────────────────────────}"

# ফাংশন: প্রতিটি কাজের স্ট্যাটাস দেখানোর জন্য
install_step() {
    local task=$1
    local cmd=$2
    echo -ne "\e[1;34m[*] $task... \e[0m"
    if eval "$cmd" >/dev/null 2>&1; then
        echo -e "\e[1;32m[DONE]\e[0m"
    else
        echo -e "\e[1;31m[ERROR]\e[0m"
    fi
}

# ১. রিপোজিটরি সিঙ্ক
install_step "Synchronizing System Repositories" "apt update -y && apt upgrade -y -o Dpkg::Options::='--force-confold'"

# ২. মূল প্যাকেজগুলো ইনস্টল (mpv অডিওর জন্য মাস্ট)
echo -e "\e[1;34m[*] Injecting Power Tools & Languages...\e[0m"
packages=(python git php bash nano nodejs ruby mpv termux-api ncurses-utils wget curl cmatrix pv figlet zsh)
for pkg in "${packages[@]}"; do
    install_step "Installing $pkg" "pkg install $pkg -y"
done

# ৩. পাইথন এনভায়রনমেন্ট সেটআপ
install_step "Upgrading Pip Manager" "pip install --upgrade pip"
install_step "Installing Python Matrix" "pip install rich requests mechanize lolcat bs4 httpx --quiet"

# ৪. Zsh রূপান্তর ও প্লাগইন সেটআপ
install_step "Transforming Shell (Bash -> Zsh)" "rm -rf ~/.oh-my-zsh && git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh --depth 1"
install_step "Installing AI Auto-Suggestions" "git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
install_step "Installing Syntax Highlighting" "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

# ৫. ডিফল্ট সেল পরিবর্তন
install_step "Reconfiguring Terminal Entry Point" "chsh -s zsh"

# ৬. স্টোরেজ পারমিশন
# এটি রান করলে ফোনে স্টোরেজ পারমিশন পপ-আপ আসতে পারে, অ্যালাউ করে দিও।
echo -ne "\e[1;34m[*] Requesting Storage Access... \e[0m"
termux-setup-storage
echo -e "\e[1;32m[DONE]\e[0m"

# ৭. পারমিশন এবং ক্লিনআপ (এখানে ফাইল মুভ করা বন্ধ করা হয়েছে)
echo -e "\e[1;34m[*] Organizing Assets & Permissions...\e[0m"
chmod +x *
rm -rf $PREFIX/etc/motd $PREFIX/etc/bash.bashrc 2>/dev/null

echo -e "\n\033[31m\033[1m        [✓] CORE SYSTEM DEPLOYED SUCCESSFULLY \033[32m" | pv -qL 12
echo -e "\033[33m\033[1m]────────────────────────────────────────────["

# ৮. সরাসরি নতুন ফিক্সড করা লগইন প্রসেস শুরু
bash login.sh
