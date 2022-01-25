#!/bin/bash

NUM=(5 10 20 50)

echo "Targets, Difference (s), Nmap (s), Masscan (s) " > masscan-nmap.csv

for n in ${NUM[@]}; do
    echo "Running for $n hosts "

    nmap -iR $n -sL | grep -oE '((1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])\.){3}(1?[0-9][0-9]?|2[0-4][0-9]|25[0-5])' > ip_address.txt

    /usr/bin/time -o nmap.txt -f "%e" nmap -iL ip_address.txt -sS -Pn -n --randomize-hosts -v --send-eth -p- > /dev/null
    /usr/bin/time -o masscan.txt -f "%e" masscan -iL ip_address.txt --ports 0-65535 > /dev/null 2>&1

    NMAP=$(cat nmap.txt)
    MASSCAN=$(cat masscan.txt)

    TIME=$(echo "scale = 2; $NMAP - $MASSCAN" | bc)

    echo "$n, $TIME, $NMAP, $MASSCAN" >> masscan-nmap.csv
  done
