#!/bin/bash
#Scan for ports, then scan the ports
#Use root for -sS
if [ "$1" == "" ]
then
  echo 'You forgot an IP address!'
  echo 'Syntax: ./nm.sh <IP Address'
  exit

else
  echo '[+] Scanning for open Ports with -sS -T4'
  ports=$(nmap -p- -sS -T4 $1 | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//) #get ports, cut rest, replace with ',' and remove last ','
  echo '[+] Ports: ' $ports
  echo '[+] Starting nmap with -T4 -A'
  echo '###############################'
  nmap -T4 -A -p$ports $1
fi