#!/usr/bin/env bash

apt-get update
sudo apt-get -y install linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update
sudo apt-get -y install docker-ce

sudo gpasswd -a vagrant docker
sudo newgrp docker

# sudo -i -u vagrant docker run hello-world

exit
