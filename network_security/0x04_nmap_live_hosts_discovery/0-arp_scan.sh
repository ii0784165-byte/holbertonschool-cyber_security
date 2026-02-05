#!/bin/bash

# Check if a subnetwork is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <subnetwork>"
    echo "Example: $0 192.168.65.0/24"
    exit 1
fi

# Run Nmap ARP scan (host discovery only, no port scan)
sudo nmap -sn -PR "$1"

