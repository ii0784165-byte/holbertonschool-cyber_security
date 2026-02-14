#!/bin/bash
declare -A standard_values | grep -Ev "^$key" /etc/ssh/sshd_config | awk '{print $2}'
