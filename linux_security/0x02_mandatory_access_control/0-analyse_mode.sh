#!/bin/bash
status=$(sestatus | grep "SELinux status" | awk '{print $3}')
echo "SELinux status: $status"
