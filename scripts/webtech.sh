#!/bin/bash

sl=~/blackhat/scripts

source $sl/color.sh
source $sl/banner.sh	
	
banner

domain=$(echo $1 | httprobe)


webtech -u $domain	

