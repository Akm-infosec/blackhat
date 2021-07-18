#!/bin/bash 

sl=~/blackhat/scripts

source $sl/banner.sh
source $sl/color.sh

banner

domain=$(echo $1 | httprobe)
echo -e "${NORMAL}"

blc $domain -ro 
