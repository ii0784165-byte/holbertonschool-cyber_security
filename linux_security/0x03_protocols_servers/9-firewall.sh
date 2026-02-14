#!/bin/bash
iptables -A INPUT -p tcp --dport 22 -j ACCEPT --dport ssh -j DROP
"CEPT\n"
