#!/bin/python

import scapy.all as scapy
import argparse

def get_arguments():

    parser = argparse.ArgumentParser()
    parser.add_argument("-t", "--target", dest="target", help="Target IP / IP range.")
    options = parser.parse_args()
    return options

def scan(ip):

    arp_req = scapy.ARP(pdst=ip)
    broadcast = scapy.Ether(dst="ff:ff:ff:ff:ff:ff")
    arp_req_broadcast = broadcast/arp_req
    answer_list = scapy.srp(arp_req_broadcast, timeout=1, verbose=False)[0]
    return answer_list

def result(answer_list):
    print("\n")
    print("IP Address\t\t\tMAC Addresss\n====================================================\n")

    for elements in answer_list:
        print(elements[1].psrc + "\t\t\t" + elements[1].hwsrc)



options = get_arguments()
scan_result = scan(options.target)
result(scan_result)
