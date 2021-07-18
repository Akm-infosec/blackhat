#!/bin/bash

SL=~/blackhat/scripts
OL=~/blackhat/output

source $SL/color.sh
source $SL/banner.sh

banner

echo -e "${GREEN}"
read -p "blackhat~# Enter domain(Ex: http://testsite.com): " domain


if [ "$domain" == "" ]
then
	echo -e "${RED} [-] Please Enter Domain!"

elif [ "$domain" != "" ] 
then
	read -p "blackhat~# Do you want to store output in a file(y|N): " yesno
		
	if [ "$yesno" == "N" ] || [ "$yesno" == "" ]
	then
		echo -e "\n\n"
		echo -e "${MAG}[INF] ${YELLOW}Enumerating Hidden Files/Folders for $domain"
		echo -e "\n${CYAN}"
		dirb $domain | grep -e "\+"
	else     
		echo -e "${GREEN}"
		read -p "blackhat~# Enter filename(Ex: /Path/To/FIle/filename.txt): " file
		echo -e "\n\n${MAG}[INF] ${YELLOW}Enumerating Hidden Files/Folders for $domain"
		echo -e "\n${CYAN}"
		dirb $domain | grep -e "\+" > $file
		echo -e "${MAG}[INF]${YELlOW} FINISH..."		
		echo -e "${MAG}[INF]${YELlOW} Output Stored in ${RED}$file"
	fi
else
	echo " "

fi	

