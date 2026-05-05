#!/bin/bash

# Navigate to the TermIstiack directory
cd $HOME/TermIstiack || { echo "Error: Directory not found!"; exit 1; }

echo -e "\e[1;34m[*] Fetching latest updates for TermIstiack...\e[0m"

# Reset local changes to prevent merge conflicts
git reset --hard HEAD > /dev/null 2>&1

# Pull the latest changes from the remote repository
if git pull origin main; then
    # Refresh permissions after update
    chmod +x *
    echo -e "\n\e[1;32m[+] TermIstiack updated successfully!\e[0m"
    echo -e "\e[1;33m[*] Restarting setup to apply changes...\e[0m"
    sleep 2
    bash setup.sh
else
    echo -e "\n\e[1;31m[!] Update failed. Please check your internet connection.\e[0m"
fi