#!/bin/bash

source color.sh

main_menu_content()
{
echo "1. Web"
echo "2. Network"
echo "3. System"
echo "4. Wifi"
}
main_menu_content

read -p "blackhat~# Enter choice: " choice

webhack()
{
	menu()
	{
	echo "1. Information Gathering"
	echo "2. Attacks"
	}
read -p "blackhat~# Enter choice: " choice

case $choice in 

        1) webtech.sh;;
        2) echo "Ok fine";;
esac

}
case $choice in
	
	1) webhack;;
	2) echo "Network Hacking";;
	3) echo "System Hacking";;
	4) echo "WiFi Hacking";;
esac
	


