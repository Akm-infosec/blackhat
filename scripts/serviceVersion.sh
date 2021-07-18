#!/bin/bash

sl=~/blackhat/scripts

source $sl/color.sh
 
echo -e "${GREEN}PORT\tSTATE  SERVICE\t\tVERSION${NORMAL}"
echo -e "\n"
nmap -sV $1 | grep "open" 


