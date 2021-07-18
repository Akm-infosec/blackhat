#!/bin/bash 

sl=~/blackhat/scripts

source $sl/color.sh
source $sl/banner.sh

banner

whois $1 | awk 'NR==54, NR==108 {print NR,$0}' | cut -d " " -f 2,3,4,5,6,7 






















 
