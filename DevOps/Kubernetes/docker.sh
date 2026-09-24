#!/bin/bash

# Update package information
apt-get update -y

# Install required packages
apt-get install -y \
    ca-certificates \
    curl \
    gnupg

# Create keyrings directory
install -m 0755 -d /etc/apt/keyrings

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg \
    -o /etc/apt/keyrings/docker.asc

chmod a+r /etc/apt/keyrings/docker.asc

# Add Docker repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" \
  > /etc/apt/sources.list.d/docker.list

# Update package information
apt-get update -y

# Install Docker Engine and related components
apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

# Enable and start Docker
systemctl enable docker
systemctl start docker

# Add the default Azure user to the Docker group
usermod -aG docker azureuser

# Verify Docker installation
docker --version

# Verify Docker Compose
docker compose version

echo "Docker installation completed successfully."