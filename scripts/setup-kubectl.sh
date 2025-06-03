#!/bin/sh
if [ -f /etc/redhat-release ]; then
  echo "Red Hat-based distribution detected."
  # Check if the Kubernetes repo file already exists
  if [ ! -f /etc/yum.repos.d/kubernetes.repo ]; then
    echo "Adding Kubernetes repository..."
    cat <<EOF | sudo tee /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/
enabled=1
gpgcheck=1
gpgkey=https://pkgs.k8s.io/core:/stable:/v1.32/rpm/repodata/repomd.xml.key
EOF
    echo "Installing kubectl..."
    sudo yum install -y kubectl
  else
    echo "Kubernetes repository already exists. Installing kubectl..."
    sudo yum install -y kubectl
  fi
elif [ -f /etc/debian_version ]; then
  echo "Debian-based distribution detected."
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl gnupg

  # Create the keyrings directory if it doesn't exist
  if [ ! -d /etc/apt/keyrings ]; then
    sudo mkdir -p -m 755 /etc/apt/keyrings
  fi

  curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.32/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
  sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg

  sudo apt-get update
  sudo apt-get install -y kubectl
else
  echo "Unsupported distribution."
  exit 1
fi
