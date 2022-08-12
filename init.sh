#!/bin/bash 

cd /home/ubuntu

mkdir .ssh
touch .ssh/authorized_keys
sudo curl https://github.com/k-r-e-b.keys >> .ssh/authorized_keys

sudo passwd -d ubuntu
sudo sed -i -E 's/#?PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo systemctl restart sshd

sudo apt-get update
sudo apt-get install docker docker-compose -y
git clone https://github.com/MystenLabs/sui.git


sudo cp sui_files/docker-compose-app.service /etc/systemd/system/
sudo systemctl enable docker-compose-app

cp sui_files/* sui/docker/fullnode/
wget -P sui/docker/fullnode/ https://github.com/MystenLabs/sui-genesis/raw/main/devnet/genesis.blob

sudo systemctl start docker-compose-app