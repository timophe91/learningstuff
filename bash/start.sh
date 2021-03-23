#!/bin/bash
sudo apt install nmap
sudo apt install gedit
mkdir -p ~/ctf
touch ~/ctf/t
touch ~/ctf/e
touch ~/ctf/runAll.sh
cp ../python4fun/* ~/ctf/
cp getHosts.sh ~/ctf/
cp nm.sh ~/ctf/
cp findString.sh ~/ctf/
cd ~/ctf
echo "python3 ./runAll.py t e" > runAll.sh
chmod +x runAll.sh
rm *.txt
chmod +x *.exp
chmod +x *.sh
chmod +x *.py
gedit &