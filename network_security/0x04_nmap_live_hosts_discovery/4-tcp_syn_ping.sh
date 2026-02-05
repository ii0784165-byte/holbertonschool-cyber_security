#!/bin/bash
sudo nmap -sn -PN22,80,443 $1
