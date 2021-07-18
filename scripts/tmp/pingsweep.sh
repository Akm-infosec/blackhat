#!/bin/bash

sl=~/blackhat/scripts

source $sl/color.sh
source $sl/banner.sh

banner

echo -e "${BOLD}${YELLOW}[+] Finding hosts on network...${NORMAL}"
echo -e "\n"

for ip in `seq 1 254`
do
	ping -c 1 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr ":" " " &
done
