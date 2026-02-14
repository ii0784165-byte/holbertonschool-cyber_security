#!/bin/bash
showmount -e "$1" 2>/dev/null | grep -E " *\(everyone\)" | awk '{print $1 " (everyone)"}'
