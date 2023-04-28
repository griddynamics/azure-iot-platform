#!/bin/bash

wget https://packages.microsoft.com/config/ubuntu/18.04/multiarch/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update && \
sudo apt-get install moby-engine -y

cat <<EOF > /etc/docker/daemon.json
{
    "log-driver": "local"
}
EOF

sudo systemctl restart docker

sudo apt-get update
sudo apt-get install aziot-edge defender-iot-micro-agent-edge

sudo git clone https://github.com/griddynamics/azure-iot-platform.git /opt/iot