#!/bin/bash

# Navigate to the correct system directory
cd $PREFIX/etc

echo -e "\e[1;31m[!] Removing TermIstiack customizations...\e[0m"
sleep 1.0

# 1. Restore the original MOTD (Message of the Day)
echo -e "\e[1;34m[*] Restoring default welcome message...\e[0m"
echo 'Welcome to Termux!' > motd
echo >> motd
echo 'Wiki:            https://wiki.termux.com' >> motd
echo 'Community forum: https://termux.com/community' >> motd
echo 'Gitter chat:     https://gitter.im/termux/termux' >> motd
echo "IRC channel:     #termux on freenode" >> motd
echo >> motd
echo 'Working with packages:' >> motd
echo >> motd
echo '* Search packages:   pkg search <query>' >> motd
echo '* Install a package: pkg install <package>' >>  motd
echo '* Upgrade packages:  pkg upgrade' >> motd
echo >> motd
echo 'Subscribing to additional repositories:' >> motd
echo >> motd
echo '* Root: pkg install root-repo' >> motd
echo '* Unstable: pkg install unstable-repo' >> motd
echo '* X11:      pkg install x11-repo' >> motd
echo >> motd
echo 'Report issues at https://termux.com/issues' >> motd
echo >> motd

# 2. Restore the original bash.bashrc
echo -e "\e[1;34m[*] Resetting bash configuration...\e[0m"
echo 'if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then' > bash.bashrc
echo '        command_not_found_handle() {' >> bash.bashrc
echo '                /data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"' >> bash.bashrc
echo '        }' >> bash.bashrc
echo 'fi' >> bash.bashrc
echo >> bash.bashrc
echo "PS1='\$ '" >> bash.bashrc

# 3. Clean up project-specific aliases from .bashrc
sed -i '/istiack/d' $HOME/.bashrc
sed -i '/cls/d' $HOME/.bashrc

echo -e "\e[1;32m[+] Successfully restored to old Termux terminal!\e[0m"
echo -e "\e[1;33m[!] Thank you for using TermIstiack. Goodbye!\e[0m"
echo