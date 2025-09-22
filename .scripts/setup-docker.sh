#!/bin/bash

APP_NAME="docker"

if command -v $APP_NAME &> /dev/null; then
    echo "$APP_NAME is already installed."
    read -p "This script will reinstall $APP_NAME by removing it first. Do you want to continue? (y/N): " choice
    if [[ $choice != "y" && $choice != "Y" ]]; then
        echo "Exiting. No changes were made."
        exit 0
    fi
fi

# Check if the system is Debian-based
if [ -f /etc/debian_version ]; then
	echo "Debian-based system detected."
	PACKAGE_MANAGER="apt"
	for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
	sudo apt-get update
	sudo apt-get install ca-certificates curl
	sudo install -m 0755 -d /etc/apt/keyrings
	sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
	sudo chmod a+r /etc/apt/keyrings/docker.asc
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" |  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
	sudo docker run hello-world
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker
	docker run hello-world
elif [ -f /etc/redhat-release ]; then
	echo "Red Hat-based system detected."
	PACKAGE_MANAGER="dnf"

	sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine podman runc
	sudo dnf -y install dnf-plugins-core
	sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
	sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        sudo systemctl enable --now docker

	sudo docker run hello-world
	sudo groupadd docker
	sudo usermod -aG docker $USER
	newgrp docker
	docker run hello-world
fi
