#!/bin/sh

rand_mac=$(hexdump -n3 -e'1/3 "50:3C:C4" 3/1 ":%02X" "\n"' /dev/random)
echo $rand_mac
