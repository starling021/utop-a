#!/bin/bash

G="\033[1;34m[*] \033[0m"
S="\033[1;32m[+] \033[0m"
E="\033[1;31m[-] \033[0m"

if [[ -d /data/data/com.termux ]]
then
if [[ -f /data/data/com.termux/files/usr/bin/utopia ]]
then
UPD="true"
else
UPD="false"
fi
else
if [[ -f /usr/local/bin/utopia ]]
then
UPD="true"
else
UPD="false"
fi
fi
{
ASESR="$(ping -c 1 -q www.google.com >&/dev/null; echo $?)"
} &> /dev/null
if [[ "$ASESR" != 0 ]]
then 
   echo -e ""$E"No Internet connection!"
   exit
fi
if [[ $(id -u) != 0 ]]
then
   echo -e ""$E"Permission denied!"
   exit
fi
sleep 1
echo -e ""$G"Installing update..."
{
rm -rf ~/utopia
rm /bin/utopia
rm /usr/local/bin/utopia
rm /data/data/com.termux/files/usr/bin/utopia
cd ~
git clone https://github.com/entynetproject/utopia.git
if [[ "$UPD" != "true" ]]
then
sleep 0
else
cd utopia
chmod +x install.sh
./install.sh
fi
} &> /dev/null
if [[ ! -d ~/utopia ]]
then
   echo -e ""$E"Installation failed!"
   exit
fi
echo -e ""$S"Successfully updated!"
sleep 1
exit
