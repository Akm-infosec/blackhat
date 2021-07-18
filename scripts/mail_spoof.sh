#!/bin/bash

sl=~/blackhat/scripts

source $sl/color.sh

for target in $1 
do 
	if [[ $(curl --connect-timeout 3 -kls --max-time 3 -d "serial=fred12&domain=${target}" -H "Content-Type: application/x-www-form-urlencoded" -X POST "https://www.kitterman.com/spf/getspf3.py") =~ 'SPF 	record passed validation test with pySPF' ]] 
	then 
		echo -e "${BLINK}${RED}${BOLD} No Record Found!${NORMAL}" 
	else 
		echo -e "${BLINK}${LGREEN}${BOLD} Record Found!${NORMAL}"
	fi 
done 

