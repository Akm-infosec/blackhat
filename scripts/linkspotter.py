#!/usr/bin/python
#discover urls in the domain by extract the href link in the content and crawl recursively to get all url

import requests
import re
import urlparse
import sys

tmp_target = sys.argv[1]
 
target1 = "http://" + tmp_target
target2 = "https://" + tmp_target

target_links = []

def extract_links(url):
	response = requests.get(url)
	return re.findall('(?:href=")(.*?)"', response.content.decode(errors="ignore"))


def crawl(target_url):
	href_links = extract_links(target_url)
		
	for link in href_links:
		link = urlparse.urljoin(target_url, link)

		if target_url in link and link not in target_links:
		    # check for link is present & unique one
		    target_links.append(link)
		    print("[+] Link >> " + link)
		    crawl(link)

crawl(target1)
crawl(target2)

