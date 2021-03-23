#!/bin/bash
mkdir ~/ctf
touch ~/ctf/t
touch ~/ctf/e
cp -R ../python4fun ~/ctf/
cp getHosts.sh ~/ctf/
cp nm.sh ~/ctf/
cp sfiles.sh ~/ctf/
sudo ./getHosts.sh > ~/ctf/t