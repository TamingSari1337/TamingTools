#!/bin/bash

#color
White="\033[37m"
Red="\033[91m"
Purple="\033[95m"



#tools

menu() {
	clear
	echo -e -n $Purple;figlet "TapauServer"
	echo ""
	echo -e $White ""
	echo -e "This Tools is still in progress"
	echo -e "1. Password Generator"
	echo -e "2. File Encrypter/Decrypter"
	echo -e "3. Ping Sweep"
	echo -e "4. Exit"
	mainmenu
}

mainmenu() {
	echo ""
	echo -e -n "Select > ";read sel
	if [ $sel == "1" ];then
	echo "Enter The Length Of The Password"
read pass

for p in $(seq 1 3)
do
	openssl rand -base64 48 | cut -c1-$pass

done
	sleep 1
	menu
	elif [ $sel == "2" ];then
		echo "Please choose The Option"

choice="Encrypt Decrypt"

select option in $choice; do
    if [ $REPLY = 1 ];then
    echo "Please enter the filename you want to encrypt"
    read file;
    gpg -c $file
    echo "The file has been encrypted"
else
    echo  "Please enter the filename you want to decrypt"
    read file2;
    gpg -d $file2
    echo "The file has been decrypted"
fi

done
	sleep 1
	menu
	elif [ $sel == "3" ];then
	echo "ENTER THE SUBNET: "
	read SUBNET
for IP in $(seq 1 254)
do
	ping -c 1 $SUBNET.$IP
done
	sleep 1
	menu
	elif [ $sel == "4" ];then
	echo -e $Red"[!] EXIT"
	sleep 1
	echo -e $White ""
	exit
	else
	echo -e $Red"[!] INVALID INPUT"
	echo -e $White ""
	fi	
}
menu
