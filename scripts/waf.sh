#!/bin/bash

sl=~/blackhat/scripts

source $sl/color.sh
source $sl/banner.sh

banner

domain=$(echo $1 | httprobe)

wafw00f $domain | grep -e "\[.\]" 2> /dev/null
