#!/bin/bash 


sl=~/blackhat/scripts

source $sl/color.sh
source $sl/banner.sh

banner

cat $1 | httprobe | sort -u 

