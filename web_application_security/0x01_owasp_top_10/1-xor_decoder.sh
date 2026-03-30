#!/bin/bash

# Əgər arqument verilməyibsə çıxış et
if [ -z "$1" ]; then
    exit 1
fi

# {xor} hissəsini silirik
encoded_string=$(echo "$1" | sed 's/^{xor}//')

# Base64-dən dekod edirik və hər bir xarakteri '_' (0x5f) ilə XOR edirik
echo "$encoded_string" | base64 -d | python3 -c "
import sys
data = sys.stdin.buffer.read()
decoded = ''.join(chr(b ^ 95) for b in data)
print(decoded, end='')
"
echo ""
