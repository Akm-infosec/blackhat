#!/usr/bin/python
#dicover subdomains of domain by bruteforcing common sub domains to the domain and
#if we get a respond then the sub-domain exist 

import requests
import sys
import color
 
def request(url):
	try:
		return requests.get("http://" + url)
	except requests.exceptions.ConnectionError:
		pass

arg = sys.argv[1]
target = sys.argv[2]

subdomain_list = []
try:
	with open("/root/blackhat/db/namelist.txt","r") as wordlist_file:
		for line in wordlist_file:
			word = line.strip()
			test_url = word + "." + target
			response = request(test_url)
			if response :
				print(test_url)
				subdomain_list.append(test_url)

except KeyboardInterrupt:
	print(color.red, "\nExiting program...")
	sys.exit()

except socket.gaierror:
	print(color.red, "\n[-] Hostname could not be resolved.")
	sys.exit()

except socket.error:
	print(color.red, "\nCouldn't connect to sever.")
	sys.exit()
