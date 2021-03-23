#!/bin/bash
sudo apt install nmap
sudo apt install gedit
mkdir -p ~/ctf
touch ~/ctf/t
touch ~/ctf/e
cp ../python4fun/* ~/ctf/
cp getHosts.sh ~/ctf/
cp nm.sh ~/ctf/
cp sfiles.sh ~/ctf/
sudo ./getHosts.sh > ~/ctf/t
cd ~/ctf
rm *.txt
chmod +x *.exp
chmod +x *.sh
chmod +x *.py
gedit &