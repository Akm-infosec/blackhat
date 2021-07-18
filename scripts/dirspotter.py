#!/bin/python3
#discover hidden directory by bruteforceing common directory name 
#if we get a respond then their is a directory then we also get the recursive of the directory.

import requests
import sys
import color

arg = sys.argv[1]
target = sys.argv[2]


def request(url):
	try:
		return requests.get("http://" + url)
	except requests.exceptions.ConnectionError:
		pass

path=[]
try:
	def dirfinder(url):
		with open("/usr/share/dirb/wordlists/common.txt","r") as wordlist:
			for line in wordlist:
				word = line.strip()
				test_url = url + "/" + word
				response = request(test_url)
				if response :
					path.append(word)
					print("[+] " + test_url)
	dirfinder(target)

except KeyboardInterrupt:
	print(color.red,"[-] Exiting Program...")				





