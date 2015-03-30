#!/bin/bash
sudo apt-get update
sudo apt-get -y remove firefox
sudo apt-get -y install curl wget git vim
git clone https://github.com/autodelete/sandboxes && cd sandboxes
./docker-install.sh
echo Adding $USER to docker group....
sudo usermod -aG docker $USER
