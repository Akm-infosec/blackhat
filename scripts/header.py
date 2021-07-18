#!/usr/bin/python

# This will extract the response header from a website

import urllib
import sys

tmp_url = sys.argv[1] # Ex: servicenow.com
url = "http://"+tmp_url

u = urllib.urlopen(url)
response_headers = u.info()
print("\n")
print(response_headers)

