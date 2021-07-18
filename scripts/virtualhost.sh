#!/bin/bash

# This script will find the virtual host 
# Hosted in a single IP

sl=~/blackhat/scripts

amass intel -whois -d $1 
