#!/bin/bash
john --wordlist=rockyou --format=nt "$1" && john --show --format=nt "$1" > 5-password.txt

