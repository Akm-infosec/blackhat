#!/bin/python3

import sys
import socket
from datetime import datetime
import time
import color


#Define your target:
TARGET = socket.gethostbyname(sys.argv[1])  # Translates a host name to IPv4
PORT_RANGE = sys.argv[2] # Takes port as input

start_port, end_port = PORT_RANGE.split("-")
start_port, end_port = int(start_port), int(end_port)

print("\n\n Scanning target: " + TARGET)
t1 = str(datetime.now())
print(" Starting Port Scanner at " + t1 + "\n")

#Try-Statement (if it can't do, it has an exception):
try:
	for port in range(start_port, end_port): 
		s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
		socket.setdefaulttimeout(1)  # waits 1 second before timing out
		result = s.connect_ex((TARGET,port))  #returns an error indicator (0 if the port is open, error is 1)
		if result == 0:
			print(color.green, "Port", color.yellow ,port , color.green, "is open", color.normal)
			time.sleep(0.5)
		s.close()
		
except KeyboardInterrupt:
	print(color.red, "\nExiting program...")
	sys.exit()

except socket.gaierror:
	print(color.red, "\n[-] Hostname could not be resolved.")
	sys.exit()

except socket.error:
	print(color.red, "\nCouldn't connect to sever.")
	sys.exit()
	







