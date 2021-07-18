#!/bin/bash

SL=~/blackhat/scripts
OL=~/blackhat/output

source $SL/color.sh
source $SL/banner.sh

banner

echo -e "${GREEN}"
read -p "blackhat~# Enter Domain Name(Ex: testsite.com): " domain


if [ "$domain" == "" ]
then
	echo -e "${RED} [-] Please Enter Domain!"

else
	read -p "blackhat~# Do you want to store output in a file(y|N): " yesno
		
	if [ "$yesno" == "N" ] || [ "$yesno" == "" ]
	then
		echo -e "\n\n"
		echo -e "${MAG}[INF] ${YELLOW}Enumerating subdomains for \033[31;5m$domain\033[0m"
		echo -e "\n${CYAN}"
		amass enum -d $domain >& $OL/subdomains.txt; 
		assetfinder --subs-only $domain >> $OL/subdomains.txt;
		cat $OL/subdomains.txt | grep -e "$domain$" | sort -u > $OL/$domain_subdomains.txt
		cat $OL/$domain_subdomains.txt
	else     
		echo -e "${GREEN}"
		read -p "blackhat~# Enter filename(Ex: /Path/To/FIle/filename.txt): " outfile
		echo -e "\n\n${MAG}[INF] ${YELLOW}Enumerating subdomains for \033[31;5m$domain\033[0m"
		echo -e "\n${CYAN}"
		amass enum -d $domain >& $OL/subdomains.txt
		assetfinder --subs-only $domain | grep -e "$domain$" | sort -u >> $OL/subdomains.txt
		echo -e "${MAG}[INF] ${YELlOW}Storing output in $outfile"		
		echo -e "${MAG}[INF] ${YELlOW}Completed..."
	fi
fi
