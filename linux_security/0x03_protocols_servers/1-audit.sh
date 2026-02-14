#!/bin/bash
declare -A standard_values | grep -i "^$key" /etc/ssh/sshd_config | awk '{print $2}'
